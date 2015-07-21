do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .run (routehelper) ->

      routes =
        [
          state: 'dashboard'
          config:
              url: '/dashboard'
              templateUrl: 'app/dashboard/dashboard.html'
              controller: 'Dashboard as vm'
              data:
                title: 'dashboard'
                settings:
                    nav: 1
                    content: '<i class="fa fa-dashboard"></i> Dashboard'
        ]

      routehelper.configureRoutes(routes, '/dashboard')
