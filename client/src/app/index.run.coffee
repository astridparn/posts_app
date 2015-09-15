angular.module "postsAppb"
  .run ($log) ->
    $log.debug 'runBlock end'

  .run [
    '$rootScope'
    '$location'
    ($rootScope, $location) ->
      $rootScope.$on 'auth:login-success', ->
        $location.path '/posts'
      $rootScope.$on 'auth:logout-success', ->
        $location.path '/sign_in'
  ]
