angular.module('blogApp')
  .component('newPost', {
    controller: newPostController,
    templateUrl: 'components/newPost/new-post.template.html'
  });

  function newPostController($state, PostService){
    var self = this;


    self.newPostSubmit = function(){
      console.log(self.post);

      var newPost = {
        title: self.post.title,
        description: self.post.description
      };

      function onSuccess(res){
        console.log(res);
        self.post = {};
      }

      function onError(err){
        console.log(err);
      }

      PostService.newPost(newPost).then(onSuccess, onError);
    };
  }
