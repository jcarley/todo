do ->
  'use strict'

  angular.module 'blocks.router'
    .factory 'routerHelper', routehelper

  routehelper =
    ($locationProvider, $stateProvider, $urlRouterProvider, $state) ->

      $locationProvider.html5Mode(true)

      configureStates = (states, otherwisePath) ->
        $stateProvider.state(state.state, state.config) for state in states
        $urlRouterProvider.otherwise(otherwisePath) if otherwisePath

      getStates = ->
        $state.get()

      configureStates: configureStates
      getStates: getStates
