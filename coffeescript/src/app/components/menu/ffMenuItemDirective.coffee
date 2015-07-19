do ->
  "use strict"

  angular
    .module("app.components.menu")
    .directive 'ffMenuItem', ->
      scope:
        label: '@'
        icon: '@'
        route: '@'
      require: '^ffMenu'
      templateUrl: 'app/components/menu/ffMenuItemTemplate.html'
      link: (scope, el, attr, ctrl) ->

        el.on 'click', (evt) ->
          evt.stopPropagation()
          evt.preventDefault()

          scope.$apply ->
            previousActiveElement = ctrl.getActiveElement()
            if previousActiveElement
              previousElementLink = $(previousActiveElement[0].firstChild)
              previousElementLink.removeClass("active")

            currentElementLink = $(el[0].firstChild)
            currentElementLink.addClass("active")

            ctrl.setActiveElement(el)
            ctrl.setRoute(scope.route)


