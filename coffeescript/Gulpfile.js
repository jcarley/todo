var gulp = require('gulp');
var args = require('yargs').argv;
var config = require('./gulp.config');
var del = require('del');
var bowerMain = require('bower-main');
var runSequence = require('run-sequence');
var $ = require('gulp-load-plugins')({lazy: true});

gulp.task('help', $.taskListing);
gulp.task('default', ['help']);

gulp.task('vet', function() {
  log("Linting coffeescript source files");
  var stylish = require('coffeelint-stylish');

  return gulp
    .src(config.coffee.src)
    .pipe($.plumber())
    .pipe($.coffeelint())
    .pipe($.coffeelint.reporter(stylish))
    .pipe($.coffeelint.reporter('fail'));
});

gulp.task('coffee', ['vet'], function() {
  log("Transpiling coffeescript into javascript");

  return gulp
    .src(config.coffee.src)
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe($.coffee({bare: true}).on('error', $.util.log))
    .pipe($.sourcemaps.write(config.coffee.maps))
    .pipe(gulp.dest(config.coffee.dest));
});

gulp.task('clean', function(done) {
  log('Cleaning: ' + $.util.colors.blue(config.client.dest));
  del(config.client.dest, done);
});

gulp.task('styles', function() {
  log('Coping CSS');

  return gulp
    .src(config.styles.src)
    .pipe($.plumber())
    .pipe($.autoprefixer({browsers: ['last 2 versions', '> 5%']}))
    .pipe(gulp.dest(config.styles.dest));
});

gulp.task('vendor:js', function() {
  log('Concat vendor js and place in build folder');

  var bowerMainJavaScriptFiles = bowerMain('js','min.js');

  return gulp
    .src(bowerMainJavaScriptFiles.normal)
    .pipe($.if(args.verbose, $.print()))
    .pipe($.concat('vendor-scripts.js'))
    .pipe(gulp.dest(config.client.vendor))
});

gulp.task('vendor:css', function() {
  log('Concat vendor css and place in build folder');

  var bowerMainCSSFiles = bowerMain('css', 'min.css');

  return gulp
    .src(bowerMainCSSFiles.normal)
    .pipe($.if(args.verbose, $.print()))
    .pipe($.concat('vendor-styles.css'))
    .pipe(gulp.dest(config.client.vendor))
});

gulp.task('templatecache', function() {
  log('Creating AngularJS $templateCache');

  return gulp
    .src(config.htmltemplates.src)
    .pipe($.minifyHtml({empty: true}))
    .pipe($.angularTemplatecache(
      config.templateCache.file,
      config.templateCache.options
    ))
    .pipe(gulp.dest(config.htmltemplates.dest));
});

gulp.task('inject', ['coffee'], function() {
  log('Wire up the app css and js into the html');

  return gulp
    .src(config.index.src)
    .pipe($.plumber())
    .pipe($.inject(gulp.src(config.css.vendor.src, {read: false}), {name: 'bower', ignorePath: ['build']}))
    .pipe($.inject(gulp.src(config.css.app.src, {read: false}), {ignorePath: ['build']}))
    .pipe($.inject(gulp.src(config.js.vendor.src, {read: false}), {name: 'bower', ignorePath: ['build']}))
    .pipe($.inject(gulp.src(config.js.app.src, {read: false}), {ignorePath: ['build']}))
    .pipe(gulp.dest(config.client.dest));
});

gulp.task('build', ['clean'], function (cb) {
  runSequence(['vendor:js', 'vendor:css'], 'styles', 'templatecache', 'inject', cb);
});

/////////////////////////////////

function log(msg) {
  if (typeof(msg) === 'object') {
    for (var item in msg) {
      if (msg.hasOwnProperty(item)) {
        $.util.log($.util.colors.blue(msg[item]));
      }
    }
  } else {
    $.util.log($.util.colors.blue(msg));
  }
}
