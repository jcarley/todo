do ->
  'use strict'

  angular
    .module 'app.common'
    .factory 'TodoItemsService', ($q) ->

      all: ->
        $q.when [
            {name: 'Mow'}
            {name: 'Clean'}
            {name: 'Drink'}
          ]

