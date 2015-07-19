do ->
  "use strict"

  angular
    .module("app.components.menu")
    .directive 'ffMenu', ->
      scope: {}
      transclude: true
      templateUrl: 'app/components/menu/ffMenuTemplate.html'
      controller: 'ffMenuController'
      link: (scope, el, attr) ->

