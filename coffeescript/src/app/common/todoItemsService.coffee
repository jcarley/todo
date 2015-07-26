do ->
  'use strict'

  angular
    .module 'app.common'
    .service 'TodoItemsService', do ->

      class TodoItemsService
        constructor: ($q) ->
          @q = $q
          @init()

        init: ->
          @itemsCollection = [
            {id: 1, name: 'Mow'}
            {id: 2, name: 'Clean'}
            {id: 3, name: 'Drink'}
          ]

        all: ->
          @q.when @itemsCollection

        addItem: (itemName) ->
          deferred = @q.defer()
          @itemsCollection.push {id: 4, name: itemName}
          deferred.resolve(@itemsCollection)
          deferred.promise

