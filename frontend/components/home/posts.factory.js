angular.module('blogApp')
  .factory('postsFactory', postsFactory);

  function postsFactory($http){
    // var urlBase = 'data/post.json';
    var urlBase = 'http://localhost:3000/api/v1posts';
    var dataFactory = {};

    dataFactory.getPosts = function(){
      return $http.get(urlBase);
    };

    return dataFactory;
  }
