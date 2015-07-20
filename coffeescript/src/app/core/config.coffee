do ->
  'use strict'

  angular
    .module 'app.core'
    .config (toastr) ->
      toastr.options.timeOut = 4000
      toastr.options.positionClass = 'toast-bottom-right'
    .config ($stateProvider, $urlRouterProvider, routehelperConfigProvider) ->
      config = routehelperConfigProvider.$get()
      config.config.$stateProvider = $stateProvider
      config.config.$urlRouterProvider = $urlRouterProvider
