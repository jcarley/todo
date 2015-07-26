do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .controller 'AddTodoItem', do ->

      class AddTodoItem
        constructor: (logger, $modalInstance, TodoItemsService) ->
          @item = { name: "" }
          @logger = logger
          @modalInstance = $modalInstance
          @todoItemsService = TodoItemsService

        ok: ->
          @todoItemsService.addItem(@item.name).then =>
            @modalInstance.close()

        cancel: ->
          @modalInstance.dismiss('cancel')

