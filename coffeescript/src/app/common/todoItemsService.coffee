do ->
  'use strict'

  angular
    .module "app.dashboard"
    .service "TodoItemsService", do ->

      class TodoItemsService

        all: -> [
          {name: 'Mow'}
          {name: 'Clean'}
          {name: 'Drink'}
        ]

