'use strict'

angular.module('postsAppb')
  .controller 'UserRegistrationsController', [
    '$scope'
    '$auth'
    ($scope, $auth) ->
      $scope.handleRegBtnClick = ->
        $auth.submitRegistration($scope.registrationForm).then ->
          console.log 'logging after registration'
          $auth.submitLogin
            email: $scope.registrationForm.email
            password: $scope.registrationForm.password
          console.log 'login after registration'
        .catch (reason) ->
          console.log 'registration failed'
          $scope.error = reason.data.errors.full_messages
  ]
