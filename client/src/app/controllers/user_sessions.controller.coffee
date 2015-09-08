'use strict'

angular.module('postsAppb').controller 'UserSessionsController', [
  '$scope'
  ($scope) ->
    $scope.$on 'auth:login-error', (ev, reason) ->
      $scope.error = reason.errors[0]
]
