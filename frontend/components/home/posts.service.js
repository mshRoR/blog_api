angular.module('blogApp')
  .service('PostService', PostService);

  function PostService($http, RootUrl){
    // var urlBase = 'data/post.json';
    var urlBase = RootUrl + '/posts/';
    var service = {
      getAllPost: function(pageNo, limit){
        return $http.get(urlBase+'page/'+pageNo+'/'+limit).then(function(resp){
          return resp.data;
        });
      },

      getPost: function(id){
        console.log(id);
        // function postMatchesParam(post){
        //   // console.log(post);
        //   // console.log(post.no == id ? true: false);
        //   return post.no === parseInt(id);
        // }
        //
        // return service.getAllPost().then(function(post){
        //   return post.find(postMatchesParam);
        // });
          return $http.get(urlBase+id).then(function (resp) {
            console.log(resp.data);
            return resp.data;
          });
      },

      newPost: function(data){
        return $http.post(urlBase, data);
      },

      updatePost: function (id, data) {
        return $http.patch(urlBase+id, data);
      },

      deletePost: function(id){
        return $http.delete(urlBase+id);
      }
    };

    return service;
  }
