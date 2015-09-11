angular.module "postsAppb"
  .controller "PostsController", ($scope, Post) ->
    Post.query().then (posts) -> $scope.posts = posts

    $scope.addPost = ->
      console.log "adding post " + JSON.stringify $scope.createPostForm

      new Post($scope.createPostForm).create().then ->
        $scope.posts.push $scope.createPostForm
        $scope.createPostForm = {};
      .catch (reason) ->
        console.log 'new post creation failed'
        $scope.error = "Failed to create post"
