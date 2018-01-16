(function(){
  'use strict';

  angular.module('blogApp')
  .component('postUpdate', {
    bindings: { post: '<' },
    controller: PostUpdateController,
    templateUrl: 'components/postUpdate/post-update.template.html'
  });

  function PostUpdateController($state, $stateParams, PostService){
    var self = this;

    self.postUpdateSubmit = function(){
      var id = self.post.id;
      var post = {
        title: self.post.title,
        description: self.post.description
      };
      console.log(post);
      function onSuccess(response){
        console.log(response);
        $state.go('postDetails', {id: id});
      }
      function onError(err){
        console.log(err);
      }
      PostService.updatePost(id, post).then(onSuccess, onError);
    };

    // self.$onInit = function(){
    //   postsFactory.getPosts().then(function(response){
    //     self.post = response.data[$stateParams.id - 1];
    //   });
    // };

    console.log($stateParams);
  }  
})();
