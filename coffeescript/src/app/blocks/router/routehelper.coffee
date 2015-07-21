do ->
  'use strict'

  angular
    .module 'blocks.router'
    .provider 'routehelperConfig', ->
      @config = {}
      get = =>
        config: @config
      $get: get
    .factory 'routehelper',
      ($location, $rootScope, logger, routehelperConfig) ->

        configureRoutes = (routes, otherwisePath) ->
          $urlRouterProvider = routehelperConfig.config.$urlRouterProvider

          if otherwisePath
            $urlRouterProvider.otherwise(otherwisePath)

          addRoute(route.state, route.config) for route in routes

        addRoute = (state, config) ->
          $stateProvider = routehelperConfig.config.$stateProvider
          $stateProvider.state(state, config)
          logger.info "New url added for #{state}", config, "AddRoute"

        sync = ->
          $injector = angular.injector()
          $urlRouterProvider = routehelperConfig.config.$urlRouterProvider
          $urlRouter = $injector.invoke($urlRouterProvider.$get)
          $urlRouter.sync()

        configureRoutes: configureRoutes
        sync: sync
