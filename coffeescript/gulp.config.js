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

config.htmltemplates = {
  src: path.join(config.PROJECT_SRC, 'app/', '**/*.html'),
  dest: path.join(config.PROJECT_BUILD, 'app/')
};

config.templateCache = {
  file: 'templates.js',
  options: {
    module: 'app.core',
    standAlone: false,
    root: 'app/'
  }
};

config.client = {
  src: config.PROJECT_SRC,
  dest: config.PROJECT_BUILD,
  vendor: config.PROJECT_BUILD + 'vendor/',
};

config.coffee = {
  src: config.PROJECT_SRC + '**/*.coffee',
  dest: config.PROJECT_BUILD,
  maps: './maps',
};

config.styles = {
  src: config.PROJECT_SRC + 'styles/**/*.css',
  dest: config.PROJECT_BUILD + 'styles/'
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

config.js = {
  app: {
    src: [
      config.PROJECT_BUILD + 'app/**/*.module.js',
      config.PROJECT_BUILD + 'app/**/*.js',
      '!' + config.PROJECT_BUILD + '**/*.spec.js',
    ]
  },
  vendor: {
    src: [
      config.PROJECT_BUILD + 'vendor/**/*.js',
    ]
  }
};

config.fonts = {
  src: config.PROJECT_ROOT + 'bower_components/font-awesome/fonts/**/*.*',
  dest: config.PROJECT_BUILD + 'fonts/'
};

config.bower = {
  json: require('./bower.json'),
  directory: config.PROJECT_ROOT + 'bower_components/',
  ignorePath: '..'
};

config.getWiredepDefaultOptions = function() {
  var options = {
    bowerJson: config.bower.json,
    directory: config.bower.directory,
    ignorePath: config.bower.ignorePath
  };
  return options;
};

module.exports = config;
