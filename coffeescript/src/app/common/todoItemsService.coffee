do ->
  'use strict'

  angular
    .module 'app.common'
    .factory 'TodoItemsService', ($q) ->

      all: ->
        $q.when [
            {id: 1, name: 'Mow'}
            {id: 2, name: 'Clean'}
            {id: 3, name: 'Drink'}
          ]

