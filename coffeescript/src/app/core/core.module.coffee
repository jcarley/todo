do ->
  'use strict'

  angular.module 'app.core', [
      'ngAnimate'
      'ui.router'
      'ngSanitize'

      'app.components'

      # 'blocks.exception'
      'blocks.logger'
      'blocks.router'
  ]
