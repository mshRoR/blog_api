angular.module('blogApp')
  .component('postDetails', {
    bindings: { post: '<' },
    controller: PostDetailsController,
    templateUrl: 'components/postDetails/post-details.template.html'
  });

  function PostDetailsController($stateParams, postsFactory){
    var self = this;
    
    // self.$onInit = function(){
    //   postsFactory.getPosts().then(function(response){
    //     self.post = response.data[$stateParams.id - 1];
    //     console.log(self.post);
    //   }, function(error){
    //     console.log(error.message);
    //     self.status = 'Unable to get post' + error.message;
    //   });
    // };
    // console.log($stateParams.id);
  }
