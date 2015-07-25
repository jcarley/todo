do ->
  'use strict'

  angular
    .module 'app.common'
    .factory 'TodoItemsService', ($q) ->

      all: ->
        defObj = $q.defer()
        defObj.resolve [
            {name: 'Mow'}
            {name: 'Clean'}
            {name: 'Drink'}
          ]
        defObj.promise

