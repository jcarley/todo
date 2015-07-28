'use strict';

var path = require('path');
var config = {};

config.PROJECT_ROOT = __dirname + '/';
config.PROJECT_SRC = path.join(config.PROJECT_ROOT, 'src/');
config.PROJECT_BUILD = path.join(config.PROJECT_ROOT, 'build/');
config.DIST = path.join(config.PROJECT_ROOT, 'dist');

config.alljs = [
  './src/app/**/*.js',
  './*.js',
  '!./src/app/bower_components/**/*.js',
  '!./node_modules/**/*.js'
];

module.exports = config;
