angular.module "postsAppb"
  .controller "PostsController", [
    '$scope'
    '$filter'
    '$log'
    'Post'
    ($scope, $filter, $log, Post) ->
      Post.query().then (posts) ->
        $scope.posts = posts

      $scope.addPost = ->
        $log.debug "adding post " + angular.toJson $scope.createPostForm

        new Post($scope.createPostForm).create().then (post) ->
          $scope.posts.push post
          $scope.createPostForm = {}
        .catch (reason) ->
          $log.debug 'new post creation failed'
          $scope.error = "Failed to create post"

      $scope.deletePost = (postToDelete) ->
        Post.get(postToDelete).then (post) ->
          post.delete().then ->
            foundItem = $filter('filter')($scope.posts, { id: post.id }, true)[0]
            index = $scope.posts.indexOf(foundItem)
            if index != -1
              $scope.posts.splice index, 1
          .catch (reason) ->
            $scope.error = "Failed to delete post"
            $log.debug reason
        .catch (reason) ->
          $scope.error = "Failed to delete post"
          $log.info reason
  ]
