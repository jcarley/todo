do ->
  'use strict'

  angular
    .module 'blocks.router'
    .provider 'routehelperConfig', ->
      @config = {}
      get = =>
        config: @config
      $get: get
    .provider 'routehelper',
      (loggerProvider, routehelperConfigProvider) ->

        get = ->
          {}

        configureRoutes = (routes, otherwisePath) ->
          routehelperConfig = routehelperConfigProvider.$get()
          $urlRouterProvider = routehelperConfig.config.$urlRouterProvider

          if otherwisePath
            $urlRouterProvider.otherwise(otherwisePath)

          addRoute(route.state, route.config) for route in routes

        addRoute = (state, config) ->
          routehelperConfig = routehelperConfigProvider.$get()
          $stateProvider = routehelperConfig.config.$stateProvider
          $stateProvider.state(state, config)

        sync = ->
          routehelperConfig = routehelperConfigProvider.$get()
          $injector = angular.injector()
          $urlRouterProvider = routehelperConfig.config.$urlRouterProvider
          $urlRouter = $injector.invoke($urlRouterProvider.$get)
          $urlRouter.sync()

        configureRoutes: configureRoutes
        sync: sync
        $get: get
