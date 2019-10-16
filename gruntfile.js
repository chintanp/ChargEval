//gruntfile.js
module.exports = function(grunt) {

    grunt.initConfig({
      watch: {
        doc: {
          files: ['**/*.rst'],
          tasks: ['shell:make'],
          options: {
            cwd: {
              files: 'docs/'
            }
          }
  
        }
      },
      shell: {
        make: {
          command: 'cd docs && make html'
        }
      }
    });
  
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-shell');
  
    grunt.registerTask('doc', ['watch:doc']);
  
  };
  
  // Add task called 'pylint', different from 'default' to perform pylint on saving
  // try this : https://stackoverflow.com/a/52336149/1328232