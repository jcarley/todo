do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .controller 'Dashboard', do ->

      class Dashboard
        constructor: (logger, $modal, TodoItemsService) ->
          @logger = logger
          @modal = $modal
          @todoItemsService = TodoItemsService
          @init()

        init: ->
          @refreshItems()

        toggleItem: (item) ->
          item.selected = !item.selected

        refreshItems: ->
          @todoItemsService
            .all()
            .then (data) =>
              @items = data

        open: ->
          modalInstance = @modal.open
            animation: true
            templateUrl: 'addTodoItem.html'
            controller: 'AddTodoItem as vm'

          modalInstance.result.then =>
            @refreshItems()
            @logger.success "New todo item added successfully", {}, "Todo"

