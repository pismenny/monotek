module.exports = (grunt) ->
	globalConfig =
		src: "src"
		dest: "build"

	grunt.initConfig
		includes:
			files:
				src: ["src/html/*.html"] # Source files
				dest: "build/html" # Destination directory
				flatten: true
				cwd: "."
				options:
					silent: false
					filenamePrefix: "../include/"
					filenameSuffix: ".html"

		clean:
			files: ["build/html/*.html", "build/*.js", "build/img/"]

		copy:
			main:
				files: [
					expand: true
					cwd: "src/img/"
					src: ["**"]
					dest: "build/img"
				,
					expand: true,
					cwd: "src/img/icons/",
					src: ["**"],
					dest: "build/img/icons/"
				,
					expand: true,
					cwd: "src/fonts/",
					src: ["**"],
					dest: "build/fonts/"
				,
					expand: true
					cwd: "src/js/"
					src: ["**"]
					dest: "build/js/"
				,
					expand: true
					cwd: "src/img/svg/"
					src: "*"
					dest: "build/img/svg/"
					filter: "isFile"
				]
		watch:
			files: ["src/html/*.html", "src/js/*.js", "src/includes/*.html", "src/img/icons*.png"]
			tasks: ["clean", "includes", "copy"]

	require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks
	grunt.registerTask "default", ["watch"]
	grunt.registerTask "a", ["clean", "includes", "copy"]