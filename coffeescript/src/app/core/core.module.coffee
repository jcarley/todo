do ->
  'use strict'

  angular.module 'app.core', [
      'ngAnimate'
      'ui.router'
      'ui.router.state'
      'ngSanitize'

      'app.components'
      'app.dashboard'

      # 'blocks.exception'
      'blocks.logger'
      'blocks.router'
  ]
