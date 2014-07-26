var path = require('path'),
    fs = require('fs');
var crypto = require('crypto'),
    shasum = crypto.createHash('sha1');

module.exports = function(grunt) {
  'use strict';

  var _ = grunt.util._;

  function generatesha1(filename) {
       var content = fs.readFileSync(filename);
 
      shasum.update("blob " + content.length + '\0', 'utf8');
      shasum.update(content);

      return shasum.digest('hex');
  }

  grunt.registerTask(
    'expose', "Expose available tasks as JSON object.", function (gruntFileName) {
      var cwd = process.cwd();
      gruntFileName = path.join(cwd, gruntFileName);
      var cacheFileName = path.join(cwd, '.sublime-grunt.cache');
      var sha1 = generatesha1(gruntFileName);
        
      var gruntsublimecache = (grunt.file.exists(cacheFileName) && grunt.file.readJSON(cacheFileName)) || {};

      if (!gruntsublimecache[gruntFileName] || gruntsublimecache[gruntFileName].sha1 !== sha1) {
        var tasks = grunt.task._tasks;
        
        _.each( tasks, function( value, key, list ) {
          // We don't want to shouw or own task
          if (key === 'expose') {
            delete list[key];
          }
          else {
            // Filter away reservered words that are none-targets
            var targets = _.difference(Object.keys(grunt.config.getRaw( key ) || {}), ['files', 'options', 'globals']);
            
            if ( targets.length > 0 ) {
              list[ key ].targets = targets;
            
              if ( targets.length > 1 ) {
                _.each( targets, function(target) {
                  var name = key + ":" + target;

                  list[name] = { name: name, info: 'Targets ' + name + '. ' + list[key].info || '', meta: { info: list[key].meta&&list[key].meta.info} };
                });
              }
            }
          }
        });

        gruntsublimecache[gruntFileName] = gruntsublimecache[gruntFileName] || {};
        gruntsublimecache[gruntFileName].sha1 = sha1;
        gruntsublimecache[gruntFileName].tasks = tasks;

        grunt.file.write(cacheFileName, JSON.stringify(gruntsublimecache));
      }
    }
  );
};