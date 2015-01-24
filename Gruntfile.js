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


      iterm: {
        expand: true,
        cwd: '_src',
        dest: 'build/',
        src: 'iterm/theme.itermcolors.jade',
        ext: '.itermcolors'
      },
      
      atom: {
        expand: true,
        cwd: '_src',
        dest: 'build/',
        src: 'solarized-dark-syntax/styles/variables.less.jade',
        ext: '.less'
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-jade');

  grunt.registerTask('default', ['jade']);
};

