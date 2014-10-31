# vim: set ai et nu ts=4 sw=4 cc=100:
#

module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        concat:
            options:
                separator: ';'
            dist:
                src: [
                    'lib/<%= pkg.name %>.js'
                    'lang/*.js'
                ]
                dest: 'build/<%= pkg.name %>.all.js'
        uglify:
            options:
                banner: '/* <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            build:
                src: 'build/<%= pkg.name %>.all.js'
                dest: 'build/<%= pkg.name %>.all.min.js'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.registerTask 'default', [
        'concat'
        'uglify'
    ]


