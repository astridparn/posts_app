angular.module "postsAppb"
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "posts",
        url: "/posts"
        templateUrl: "app/views/posts.html"
        controller: "PostsController"
        controllerAs: "posts"
      .state "sign_in",
        url: "/"
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
