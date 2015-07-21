do ->
  'use strict'

  angular
    .module 'app.layout'
    .controller 'Shell', do ->

      class Shell
        constructor: ($rootScope, $state) ->
          @rootScope = $rootScope
          @state = $state
          @rootScope.$on('ff-menu-item-selected-event', @activate)

        activate: (evt, data) =>
          console.log evt
          console.log data
          @state.go data.route



