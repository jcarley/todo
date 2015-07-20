do ->
  'use strict'

  angular
    .module "app.dashboard"
    .controller "Dashboard", do ->

      class Dashboard
        constructor: (logger) ->
          @logger = logger
