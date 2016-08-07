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

    Post.upvote = function(post) {
      return $http
        .put('/posts/' + post.id + '/upvote.json')
        .success(function(data) {
          post.upvotes += 1
        })
    }

    Post.show = function(id) {
      return $http
        .get('/posts/' + id + '.json')
        .then(function(res) {
          return res.data
        })
    }

    Post.addComment = function(id, comment) {
      return $http
        .post('/posts/' + id + '/comments.json', comment)
    }

    return Post;
  }
])
