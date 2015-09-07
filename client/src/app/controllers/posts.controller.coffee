angular.module "postsAppb"
  .controller "PostsController", ($scope, Post) ->
    Post.query().then (posts) -> $scope.posts = posts
