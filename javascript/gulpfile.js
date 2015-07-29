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
  log('Analyzing source with JSHint and JSCR');
  return gulp
    .src(config.alljs)
    .pipe($.if(args.verbose, $.print()))
    .pipe($.jscs())
    .pipe($.jshint())
    .pipe($.jshint.reporter('jshint-stylish', {verbose: true}))
    .pipe($.jshint.reporter('fail'));
});

// styles
gulp.task('styles', ['clean-styles'], function() {
  log('Copying CSS');

  return gulp
    .src(config.css.src)
    .pipe($.plumber())
    .pipe($.autoprefixer({browsers: ['last 2 versions', '> 5%']}))
    .pipe(gulp.dest(config.css.dest));
});

gulp.task('clean-styles', function(done) {
  clean(config.css.dest + '**/*.css', done);
});

// fonts
gulp.task('fonts', ['clean-fonts'], function() {
  log('Copying fonts');
  return gulp.src(config.fonts.src)
    .pipe(gulp.dest(config.fonts.dest));
});

gulp.task('clean-fonts', function(done) {
  clean(config.fonts.dest + '/**/*.*', done);
});

// template cache
gulp.task('templatecache', function() {
  log('Creating AngularJS $templateCache');

  return gulp
    .src(config.htmltemplates.src)
    .pipe($.minifyHtml({empty: true}))
    .pipe($.angularTemplatecache(
      config.templateCache.file,
      config.templateCache.options
    ))
    .pipe(gulp.dest(config.templateCache.dest));
});

// vendor:js
gulp.task('vendor:js', function() {
  log('Concat vendor js and place in build folder');

  var bowerMainJavaScriptFiles = bowerMain('js', 'min.js');

  return gulp
    .src(bowerMainJavaScriptFiles.minified)
    .pipe($.if(args.verbose, $.print()))
    .pipe($.concat('vendor-scripts.js'))
    .pipe(gulp.dest(config.client.vendor));
});

// vendor:css
gulp.task('vendor:css', function() {
  log('Concat vendor css and place in build folder');

  var bowerMainCSSFiles = bowerMain('css', 'min.css');

  return gulp
    .src(bowerMainCSSFiles.minified)
    .pipe($.if(args.verbose, $.print()))
    .pipe($.concat('vendor-styles.css'))
    .pipe(gulp.dest(config.client.vendor));
});

gulp.task('inject', function() {
  log('Wire up the app css and js into the html');

  return gulp
    .src(config.index.src)
    .pipe($.plumber())

    .pipe($.inject(
      gulp.src(config.css.vendor.src, {read: false}),
      {name: 'vendor', ignorePath: ['build']}))

    .pipe($.inject(
      gulp.src(config.css.app.src, {read: false}),
      {ignorePath: ['build']}))

    .pipe($.inject(
      gulp.src(config.js.vendor.src, {read: false}),
      {name: 'vendor', ignorePath: ['build']}))

    .pipe($.inject(
      gulp.src(config.js.app.src, {read: false}),
      {ignorePath: ['build']}))

    .pipe(gulp.dest(config.index.dest));
});

/////////////////////////////////////////////////////////

function clean(path, done) {
  log('Cleaning: ' + $.util.colors.blue(path));
  del(path, done);
}

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
