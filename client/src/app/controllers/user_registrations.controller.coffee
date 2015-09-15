'use strict'

angular.module('postsAppb')
  .controller 'UserRegistrationsController', [
    '$scope'
    '$auth'
    ($scope, $auth) ->
      $scope.handleRegBtnClick = ->
        $auth.submitRegistration($scope.registrationForm).then ->
          $auth.submitLogin
            email: $scope.registrationForm.email
            password: $scope.registrationForm.password
        .catch (reason) ->
          $scope.error = reason.data.errors.full_messages.join ", "
  ]
