angular.module "postsAppb"
  .controller "PostsController", [
    '$scope'
    '$filter'
    'PostService'
    'RolesService'
    ($scope, $filter, PostService, RolesService) ->
      PostService.query().then (posts) ->
        $scope.posts = posts

      $scope.addPost = ->
        new PostService($scope.createPostForm).create().then (post) ->
          $scope.posts.push post
          $scope.createPostForm = {}
        .catch (reason) ->
          $scope.error = "Failed to create post"

      $scope.deletePost = (postToDelete) ->
        PostService.get(postToDelete).then (post) ->
          post.delete().then ->
            foundItem = $filter('filter')($scope.posts, { id: post.id }, true)[0]
            index = $scope.posts.indexOf(foundItem)
            if index != -1
              $scope.posts.splice index, 1
          .catch (reason) ->
            $scope.error = "Failed to delete post"
        .catch (reason) ->
          $scope.error = "Failed to delete post"

      RolesService.isUser().then (result) -> $scope.isUser = result
      RolesService.isAdmin().then (result) -> $scope.isAdmin = result
  ]
