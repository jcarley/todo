do ->
  'use strict'

  angular.module 'app.core', [
      'ngAnimate'
      'ui.router.state'
      'ui.router'
      'ngSanitize'

      # 'blocks.exception'
      'blocks.logger'
      'blocks.router'
  ]
