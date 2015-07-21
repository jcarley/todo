do ->
  'use strict'

  angular.module 'app.core', [
      'ngAnimate'
      'ui.router'
      'ui.router.state'
      'ngSanitize'

      # 'blocks.exception'
      'blocks.logger'
      'blocks.router'
  ]
