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

          addRoute(route.url, route.config) for route in routes

        addRoute = (url, config) ->
          $stateProvider = routehelperConfig.config.$stateProvider
          $stateProvider.state(url, config)
          logger.info "New url added for #{url}", config, "AddRoute"


        configureRoutes: configureRoutes
