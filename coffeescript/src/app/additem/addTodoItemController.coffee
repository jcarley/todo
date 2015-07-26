do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .controller 'AddTodoItem', do ->

      class AddTodoItem
        constructor: (logger, TodoItemsService) ->
          @item = { name: "" }
          @logger = logger
          @todoItemsService = TodoItemsService

        addItem: ->
          @todoItemsService.addItem(@item.name).then =>
            @logger.success "New todo item added successfully.", @item, "Add Item"
            @item.name = ""

