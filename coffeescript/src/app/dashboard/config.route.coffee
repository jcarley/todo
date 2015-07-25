do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .config (routehelperProvider) ->

      routes =
        [
          state: 'dashboard'
          config:
            url: '/dashboard'
            templateUrl: 'app/dashboard/dashboard.html'
            controller: 'Dashboard'
            controllerAs: 'vm'
        ]

      routehelperProvider.configureRoutes(routes, '/dashboard')
