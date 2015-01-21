module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jade: {
      options: {
        pretty: true,
        data: function(dest, src){
          return require ('./_src/colors.json')
        }
      },
      compile: {
        expand: true,
        cwd: '_src/iterm',
        src: ['**/*.jade'],
        dest: 'build/',
        ext: '.itermcolors'
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-jade');

  grunt.registerTask('default', ['jade']);
};

