angular.module "postsAppb"
  .factory "PostService", (RailsResource) ->
    class Post extends RailsResource
      @configure url: "/api/posts", name: "post"
