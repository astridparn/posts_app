angular.module "postsAppb"
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "posts",
        url: "/"
        templateUrl: "app/views/posts.html"
        controller: "PostsController"
        controllerAs: "posts"

      .state "sign_in",
        url: "/sign_in"
        templateUrl: "app/views/user_sessions/new.html"
        controller: "UserSessionsController"
        controllerAs: "sign_in"

      .state "sign_up",
        url: "/sign_up"
        templateUrl: "app/views/user_registrations/new.html"
        controller: "UserRegistrationsController"
        controllerAs: "sign_up"

    $urlRouterProvider.otherwise '/'

  .factory "Post", (RailsResource) ->
    class Post extends RailsResource
      @configure url: "/api/posts", name: "post"

  .factory 'Roles', ($auth) ->
    adminRoles = [
      'admin'
    ]
    userRoles = [
      'registered'
      'admin'
    ]
    userRoleIn = (roles) ->
      $auth.validateUser().then((user) ->
        roles.indexOf(user.role.name) > -1
      ).catch ->
        false

    isAdmin: ->
      userRoleIn adminRoles
    isUser: ->
      userRoleIn userRoles

  .run [
    '$rootScope'
    '$location'
    ($rootScope, $location) ->
      $rootScope.$on 'auth:login-success', ->
        $location.path '/posts'
      $rootScope.$on 'auth:logout-success', ->
        $location.path '/sign_in'
  ]
