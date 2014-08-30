import os.path
import sublime, sublime_plugin, sys, re
import subprocess

class BeautifyRubyOnSave(sublime_plugin.EventListener):
  def on_pre_save(self, view):
    self.settings = sublime.load_settings('BeautifyRuby.sublime-settings')
    if self.settings.get('run_on_save'):
      view.run_command("beautify_ruby", {"save": False, "error": False})

class BeautifyRubyCommand(sublime_plugin.TextCommand):
  def run(self, edit, error=True, save=True):
    self.load_settings()
    self.filename = self.view.file_name()
    self.fname = os.path.basename(self.filename)
    self.erb = self.is_erb_file()
    try:
      if self.erb or self.is_ruby_file():
        self.beautify_buffer(edit)
        if save and self.settings.get('save_on_beautify'):
          self.view.run_command('save')
      else:
        if error:
          raise Exception("This is not a Ruby file.")
    except:
      msg = "Error: {0}".format(sys.exc_info()[1])
      sublime.error_message(msg)

  def beautify_buffer(self, edit):
    buffer_region = sublime.Region(0, self.view.size())
    buffer_text = self.view.substr(buffer_region)
    if buffer_text == "":
      return
    self.save_viewport_state()
    beautified_buffer = self.pipe(self.cmd(), buffer_text)
    fix_lines = beautified_buffer.replace(os.linesep,'\n')
    self.check_valid_output(fix_lines)
    self.view.replace(edit, buffer_region, fix_lines)
    self.reset_viewport_state()

  def check_valid_output(self, text):
    if text == "":
      msg = "invalid output. Check your ruby interpreter settings"
      raise Exception(msg)

  def cmd(self, path = "-"):
    if self.erb:
      script_name = 'erbbeautify.rb'
    else:
      script_name = 'rbeautify.rb'
    ruby_interpreter = self.settings.get('ruby') or self.which('ruby.exe') or self.which('ruby')
    ruby_script  = os.path.join(sublime.packages_path(), 'BeautifyRuby', 'lib', script_name)
    if not os.path.exists(ruby_script):
      msg = "script: '" + ruby_script + "' not found."
      raise Exception(msg)
    args = ["'" + str(path) + "'"] + self.config_params()
    if self.settings.get('tab_or_space') != "space":
      args.insert(0, '-t')
    return ruby_interpreter + " '" + ruby_script + "' " + ' '.join(args)

  def finalize_output(self, text):
    lines = text.splitlines()
    finalized_output = "\n".join(lines)
    if self.view.settings().get("ensure_newline_at_eof_on_save") and not text.endswith("\n"):
      text += "\n"
    return finalized_output

  def config_params(self):
    def create_parameter(name):
      return ['--'+name.replace('_','-'), str(self.view.settings().get(name)) ]

    result = []
    targets = ["tab_size","translate_tabs_to_spaces",'default_line_ending']
    for target in targets:
      result += create_parameter(target)
    return result

  def load_settings(self):
    self.settings = sublime.load_settings('BeautifyRuby.sublime-settings')

  def save_viewport_state(self):
    self.previous_selection = [(region.a, region.b) for region in self.view.sel()]
    self.previous_position = self.view.viewport_position()

  def reset_viewport_state(self):
    self.view.set_viewport_position((0, 0,), False)
    self.view.set_viewport_position(self.previous_position, False)
    self.view.sel().clear()
    for a, b in self.previous_selection:
      self.view.sel().add(sublime.Region(a, b))

  def is_ruby_file(self):
    file_patterns = self.settings.get('file_patterns') or ['\.rb', '\.rake']
    return self.match_pattern(file_patterns)

  def is_erb_file(self):
    file_patterns = self.settings.get('html_erb_patterns') or ['\.html\.erb']
    return self.match_pattern(file_patterns)

  def match_pattern(self, file_patterns):
    patterns = re.compile(r'\b(?:%s)\b' % '|'.join(file_patterns))
    return patterns.search(self.fname)

  def pipe(self, cmd, text):
    cwd = os.path.dirname(self.filename)
    beautifier = subprocess.Popen(cmd, shell=True, cwd=cwd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    out = beautifier.communicate(text.encode("utf-8"))[0]
    return out.decode('utf8')

  # http://stackoverflow.com/questions/377017/test-if-executable-exists-in-python/377028#377028
  def which(self,program):
    import os
    def is_exe(fpath):
        return os.path.isfile(fpath) and os.access(fpath, os.X_OK)

    fpath, fname = os.path.split(program)
    if fpath:
        if is_exe(program):
            return program
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            path = path.strip('"')
            exe_file = os.path.join(path, program)
            if is_exe(exe_file):
                return exe_file

    return None