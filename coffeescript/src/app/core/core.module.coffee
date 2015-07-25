do ->
  'use strict'

  angular.module 'app.core', [
    'ngResource'
    'ngAnimate'
    'ui.router.state'
    'ui.router'
    'ngSanitize'

    # 'blocks.exception'
    'blocks.logger'
    'blocks.router'
  ]
