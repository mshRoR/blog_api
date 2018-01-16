(function(){
  'use strict';
  
  angular.module('blogApp')
  .component('modalComponent', {
    bindings: {
      resolve: '<',
      close: '&'
    },
    controller: ModalController,
    templateUrl: 'components/modal/modal.template.html'
  });

  function ModalController(PostService, $state) {
    var self = this;

    self.$onInit = function () {
      console.log('component = '+ self.resolve.postId);
      self.postId = self.resolve.postId;
      self.postTitle = self.resolve.postTitle;
    };

    self.ok = function (id) {
      console.log(id);
      function onSuccess(res){
        console.log(res);
        self.close();
        $state.go('home', {}, {reload: 'home'});
      }
      function onError(err){
        console.log(err);
      }
      PostService.deletePost(id).then(onSuccess, onError);
    };

    self.cancel = function () {
      self.close();
    };
  }  
})();
