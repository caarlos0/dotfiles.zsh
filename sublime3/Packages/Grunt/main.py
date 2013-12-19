import sublime
import sublime_plugin
import os
import subprocess
import json
from hashlib import sha1 

package_name = "Grunt"
package_url = "https://github.com/tvooo/sublime-grunt"
cache_file_name = ".sublime-grunt.cache"


class GruntRunner(object):
    def __init__(self, window):
        self.window = window
        self.list_gruntfiles()

    def list_tasks(self):
        try:
            self.callcount = 0
            json_result = self.fetch_json()
        except TypeError as e:
            self.window.new_file().run_command("grunt_error", {"message": "SublimeGrunt: JSON is malformed\n\n%s\n\n" % e})
            sublime.error_message("Could not read available tasks\n")
        else:
            tasks = [[name, task['info'], task['meta']['info']] for name, task in json_result.items()]
            return sorted(tasks, key=lambda task: task)

    def run_expose(self):
        package_path = os.path.join(sublime.packages_path(), package_name)

        args = r'grunt --no-color --tasks "%s" expose' % package_path

        expose = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=get_env_with_exec_args_path(), cwd=self.wd, shell=True)
        (stdout, stderr) = expose.communicate()

        if 127 == expose.returncode:
            sublime.error_message("\"grunt\" command not found.\nPlease add Grunt's location to your PATH.")
            return

        return self.fetch_json()

    def fetch_json(self):
        jsonfilename = os.path.join(self.wd, cache_file_name)
        gruntfile = os.path.join(self.wd, "Gruntfile.js")

        if os.path.exists(jsonfilename):
           filesha1 = hashfile(gruntfile)

           json_data=open(jsonfilename)

           try:
                data = json.load(json_data)

                if data[gruntfile]["sha1"] == filesha1:
                    return data[gruntfile]["tasks"]
           finally:
               json_data.close()
        self.callcount += 1

        if self.callcount == 1: 
            return self.run_expose()

        if data is None:
            raise TypeError("Could not expose gruntfile")

        raise TypeError("Sha1 from grunt expose ({0}) is not equal to calculated ({1})".format(data[gruntfile]["sha1"], filesha1))

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


def hashfile(filename):
    with open(filename, mode='rb') as f:
        filehash = sha1()
        content = f.read();
        filehash.update(str("blob " + str(len(content)) + "\0").encode('UTF-8'))
        filehash.update(content)
        return filehash.hexdigest()


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
