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
