do ->
  'use strict'

  angular
    .module 'app.layout'
    .controller 'Shell', do ->

      class Shell
        constructor: ($rootScope, $urlRouter, routehelper) ->
          @rootScope = $rootScope
          @rootScope.$on('ff-menu-item-selected-event', @activate)
          @urlRouter = $urlRouter
          @urlRouter.sync()
          # routehelper.sync()

        activate: (evt, data) =>
          @state.go data.route


