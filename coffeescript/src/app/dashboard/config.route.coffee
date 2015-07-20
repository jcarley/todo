do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .run (routehelper) ->

      routes =
        [
          url: '/'
          config:
              templateUrl: 'app/dashboard/dashboard.html'
              controller: 'Dashboard'
              controllerAs: 'vm'
              title: 'dashboard'
              settings:
                  nav: 1
                  content: '<i class="fa fa-dashboard"></i> Dashboard'
        ]

      routehelper.configureRoutes(routes)
