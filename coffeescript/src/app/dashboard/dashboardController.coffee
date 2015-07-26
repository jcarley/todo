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
          @logger.info "Item selected", item, "ToggleItem"

        refreshItems: ->
          @todoItemsService
            .all()
            .then (data) =>
              @items = data
              @logger.success "Got all the items", {}, "Dashboard#init"

        open: ->
          modalInstance = @modal.open
            animation: true
            templateUrl: 'addTodoItem.html'
            controller: 'AddTodoItem as vm'

          modalInstance.result.then =>
            @refreshItems()



