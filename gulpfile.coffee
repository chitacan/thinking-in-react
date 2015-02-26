gulp         = require 'gulp'
changed      = require 'gulp-changed'
sass         = require 'gulp-sass'
csso         = require 'gulp-csso'
autoprefixer = require 'gulp-autoprefixer'
browserify   = require 'browserify'
watchify     = require 'watchify'
source       = require 'vinyl-source-stream'
buffer       = require 'vinyl-buffer'
babelify     = require 'babelify'
uglify       = require 'gulp-uglify'
del          = require 'del'
notify       = require 'gulp-notify'
browserSync  = require 'browser-sync'
sourcemaps   = require 'gulp-sourcemaps'
reactify     = require 'coffee-reactify'

reload = browserSync.reload
p =
  app    : './scripts/app.coffee'
  scss   : 'styles/main.scss'
  bundle : 'app.js'
  distJs : 'dist/js'
  distCss: 'dist/css'

gulp.task 'clean', (cb) ->
  del ['dist'], cb

gulp.task 'browserSync', ->
  browserSync
    server: baseDir: './'

gulp.task 'watchify', ->
  bundler = watchify browserify p.app, watchify.args

  rebundle = ->
    return bundler
      .bundle()
      .on 'error', notify.onError()
      .pipe source p.bundle
      .pipe gulp.dest p.distJs
      .pipe reload stream: true

  bundler
    .transform extension: 'coffee', reactify
    .transform babelify
    .on 'update', rebundle
  return rebundle()

gulp.task 'browserify', ->
  browserify p.app
    .transform extension: 'coffee', reactify
    .transform babelify
    .bundle()
    .pipe source p.bundle
    .pipe buffer()
    .pipe sourcemaps.init loadMaps: true
    .pipe uglify()
    .pipe sourcemaps.write './'
    .pipe gulp.dest p.distJs

gulp.task 'styles', ->
  return gulp.src p.scss
    .pipe changed p.distCss
    .pipe sass errLogToConsole: true
    .on 'error', notify.onError()
    .pipe autoprefixer 'last 1 version'
    .pipe csso()
    .pipe gulp.dest p.distCss
    .pipe reload stream: true

gulp.task 'watchTask', ->
  gulp.watch p.scss, ['styles']

gulp.task 'watch', ['clean'], ->
  gulp.start ['browserSync', 'watchTask', 'watchify', 'styles']

gulp.task 'build', ['clean'], ->
  process.env.NODE_ENV = 'production'
  gulp.start ['browserify', 'styles']

gulp.task 'default', ->
  console.log 'Run "gulp watch or gulp build"'
