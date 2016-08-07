angular.module('flapperNews')
.factory('posts', [
  '$http',
  function($http) {
    var Post = {
      posts: []
    }

    Post.index = function() {
      return $http
        .get('/posts.json')
        .success(function(data) {
          angular.copy(data, Post.posts)
        })
    }

    Post.create = function(post) {
      return $http
        .post('/posts.json', post)
        .success(function(data) {
          Post.posts.push(data)
        })
    }

    return Post;
  }
])
