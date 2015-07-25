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
          @todoItemsService
            .all()
            .then (data) =>
              @items = data
              @logger.success "Got all the items", {}, "Dashboard#init"

