angular.module('blogApp')
  .component('postDetails', {
    bindings: { post: '<' },
    controller: PostDetailsController,
    templateUrl: 'components/postDetails/post-details.template.html'
  });

  function PostDetailsController($log, $stateParams, postsFactory, $sce){
    var self = this;

      self.$onInit = function(){
         $log.debug('Des: '+self.post.description);
         self.post.description = $sce.trustAsHtml(self.post.description);
      };
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
