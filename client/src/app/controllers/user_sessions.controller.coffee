'use strict'

angular.module('postsAppb')
  .controller 'UserSessionsController', [
    '$scope'
    '$auth'
    ($scope, $auth) ->
      $scope.$on 'auth:login-error', (ev, reason) ->
        $scope.error = reason.errors[0]
  ]
