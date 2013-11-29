import sublime
import sublime_plugin
import os
import re
import subprocess
import json

package_name = "Grunt"
package_url = "https://github.com/tvooo/sublime-grunt"

regex_json = re.compile(r'EXPOSE_BEGIN(.*)EXPOSE_END', re.M | re.I | re.DOTALL)


class GruntRunner(object):
    def __init__(self, window):
        self.window = window
        self.list_gruntfiles()

    def list_tasks(self):
        package_path = os.path.join(sublime.packages_path(), package_name)

        args = r'grunt --no-color --tasks "%s" expose' % package_path

        expose = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=get_env_with_exec_args_path(), cwd=self.wd, shell=True)
        (stdout, stderr) = expose.communicate()

        if 127 == expose.returncode:
            sublime.error_message("\"grunt\" command not found.\nPlease add Grunt's location to your PATH.")
            return

        stdout = stdout.decode('utf8')
        if stderr:
            stderr = stderr.decode('utf8')
        else:
            stderr = u''
        json_match = regex_json.search(stdout)

        if json_match is not None:
            try:
                json_result = json.loads(json_match.groups()[0])
            except TypeError:
                self.window.new_file().run_command("grunt_error", {"message": "SublimeGrunt: JSON is malformed\n\n" + json_match.groups()[0]})
                sublime.error_message("Could not read available tasks\n")
            else:
                tasks = [[name, task['info'], task['meta']['info']] for name, task in json_result.items()]
                return sorted(tasks, key=lambda task: task)
        else:
            self.window.new_file().run_command("grunt_error", {"message": "SublimeGrunt: Could not expose available tasks\n\n" + stdout + "\n\n" + stderr})
            sublime.error_message("Could not expose available tasks\n")

    def list_gruntfiles(self):
        self.grunt_files = []
        self.folders = []
        for f in self.window.folders():
            self.folders.append(f)
            if os.path.exists(os.path.join(f, "Gruntfile.js")):
                self.grunt_files.append(os.path.join(f, "Gruntfile.js"))
            elif os.path.exists(os.path.join(f, "Gruntfile.coffee")):
                self.grunt_files.append(os.path.join(f, "Gruntfile.coffee"))
        if len(self.grunt_files) > 0:
            if len(self.grunt_files) == 1:
                self.choose_file(0)
            else:
                self.window.show_quick_panel(self.grunt_files, self.choose_file)
        else:
            sublime.error_message("Gruntfile.js or Gruntfile.coffee not found!")

    def choose_file(self, file):
        self.wd = os.path.dirname(self.grunt_files[file])
        self.tasks = self.list_tasks()
        if self.tasks is not None:
            self.window.show_quick_panel(self.tasks, self.on_done)

    def on_done(self, task):
        if task > -1:
            path = get_env_path()
            exec_args = {'cmd': "grunt --no-color " + self.tasks[task][0], 'shell': True, 'working_dir': self.wd, 'path': path}
            self.window.run_command("exec", exec_args)


def get_env_path():
    path = os.environ['PATH']
    settings = sublime.load_settings('SublimeGrunt.sublime-settings')
    if settings:
        exec_args = settings.get('exec_args')
        if exec_args:
            path = exec_args.get('path', os.environ['PATH'])
    return str(path)


def get_env_with_exec_args_path():
    env = os.environ.copy()
    settings = sublime.load_settings('SublimeGrunt.sublime-settings')
    if settings:
        exec_args = settings.get('exec_args')        
        if exec_args:
            path = str(exec_args.get('path', ''))
            if path:
                env['PATH'] = path
    return env


class GruntCommand(sublime_plugin.WindowCommand):
    def run(self):
        GruntRunner(self.window)


class GruntKillCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("exec", {"kill": True})

class GruntErrorCommand(sublime_plugin.TextCommand):
    def run(self, edit, **args):
        view = self.view
        prefix = "Please file an issue on " + package_url + "/issues and attach this output.\n\n"
        view.insert(edit, 0, prefix + args["message"])
