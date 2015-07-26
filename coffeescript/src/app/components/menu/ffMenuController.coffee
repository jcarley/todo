do ->
  "use strict"

  angular
    .module("app.components.menu")
    .controller 'ffMenuController', do ->

      class MenuController
        constructor: ($rootScope, logger) ->
          @rootScope = $rootScope
          @logger = logger

        getActiveElement: ->
          @activeElement

        setActiveElement: (el) ->
          @activeElement = el

        setRoute: (route) ->
          @rootScope.$broadcast 'ff-menu-item-selected-event', {route:route}
