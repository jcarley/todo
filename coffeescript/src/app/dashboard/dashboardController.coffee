do ->
  'use strict'

  angular
    .module 'app.dashboard'
    .controller 'Dashboard', do ->

      class Dashboard
        constructor: (logger, TodoItemsService) ->
          @logger = logger
          @todoItemsService = TodoItemsService
          @init()

        init: ->
          @refreshItems()

        toggleItem: (item) ->
          item.selected = !item.selected

        markAllAsComplete: ->
          item.selected = true for item in @items

        reset: ->
          item.selected = false for item in @items

        startEditItem: (item) ->
          item.isEditting = true

        endEditItem: (item) ->
          item.isEditting = false

        refreshItems: ->
          @logger.info "Refreshing the items list", {}, "Refresh Items"
          @todoItemsService
            .all()
            .then (data) =>
              @items = data

