'use strict';

var path = require('path');
var config = {};

config.PROJECT_ROOT = __dirname + '/';
config.PROJECT_SRC = path.join(config.PROJECT_ROOT, 'src/');
config.PROJECT_BUILD = path.join(config.PROJECT_ROOT, 'build/');
config.DIST = path.join(config.PROJECT_ROOT, 'dist');

config.index = {
  src: config.PROJECT_SRC + 'index.html',
  dest: config.PROJECT_BUILD + 'index.html'
};

config.alljs = [
  './src/app/**/*.js',
  './*.js',
  '!./src/bower_components/**/*.js',
  '!./node_modules/**/*.js'
];

config.fonts = {
  src: config.PROJECT_SRC + 'app/bower_components/font-awesome/fonts/**/*.*',
  dest: config.PROJECT_BUILD + 'fonts'
};

config.css = {
  src: config.PROJECT_SRC + 'styles/**/*.css',
  dest: config.PROJECT_BUILD + 'styles/'
};

config.htmltemplates = {
  src: path.join(config.PROJECT_SRC, 'app/', '**/*.html')
};

config.templateCache = {
  file: 'templates.js',
  options: {
    module: 'app.core',
    standAlone: false,
    root: 'app/'
  },
  dest: path.join(config.PROJECT_BUILD, 'app/')
};

config.css = {
  app: {
    src: [
      config.PROJECT_BUILD + 'styles/**/*.css'
    ]
  },
  vendor: {
    src: [
      config.PROJECT_BUILD + 'vendor/**/*.css'
    ]
  }
};

module.exports = config;
