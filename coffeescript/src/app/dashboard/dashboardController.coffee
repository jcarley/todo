do ->
  'use strict'

  angular
    .module "app.dashboard"
    .controller "Dashboard", do ->

      class Dashboard
        constructor: (logger, TodoItemsService) ->
          @logger = logger
          @todoItemsService = TodoItemsService

        items: ->
          allItems = @todoItemsService.all()
          @logger.info "Items", allItems, "Dashboard#items"
          allItems
