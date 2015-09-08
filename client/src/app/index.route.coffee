angular.module "postsAppb"
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "posts",
        url: "/"
        templateUrl: "app/views/posts.html"
        controller: "PostsController"
        controllerAs: "posts"
        resolve: auth: ($auth, $state) ->
          console.log 'validate user'
          $auth.validateUser().catch ->
            console.log 'validation error'
            $state.go 'sign_in'
          console.log 'welcome ' + $auth.user.email

      .state "sign_in",
        url: "/sign_in"
        templateUrl: "app/views/user_sessions/new.html"
        controller: "UserSessionsController"
        controllerAs: "sign_in"

    $urlRouterProvider.otherwise '/'

  .factory "Post", (RailsResource) ->
    class Post extends RailsResource
      @configure url: "/api/posts", name: "post"

  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/sign_in", name: "user"

  .run [
    '$rootScope'
    '$location'
    ($rootScope, $location) ->
      $rootScope.$on 'auth:login-success', ->
        $location.path '/posts'
        console.log 'Welcome'
      $rootScope.$on 'auth:logout-success', ->
        console.log 'goodbye'
        $location.path '/sign_in'
  ]
