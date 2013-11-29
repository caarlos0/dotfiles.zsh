module.exports = function(grunt) {
  'use strict';

  var _ = grunt.util._;

  grunt.registerTask(
    'expose', "Expose available tasks as JSON object.", function () {
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
      grunt.log.write("EXPOSE_BEGIN" + JSON.stringify(tasks) + "EXPOSE_END");
    }
  );
};