(function(){
  'use strict';

  angular.module('blogApp', [
    'ui.router',
    'ngAnimate',
    'ui.bootstrap',
    'angularTrix'
  ])
  .config(function($stateProvider, $urlServiceProvider){
    $urlServiceProvider.rules.otherwise({ state: 'home' });

    $stateProvider
      .state('home', {
        url: '/posts',
        component: 'home',
        resolve: {
          posts: function(PostService){
            return PostService.getAllPost(1, 10);
          }
        }
      })
      .state('postDetails', {
        url: '/post/:id',
        component: 'postDetails',
        resolve: {
          post: function(PostService, $transition$){
            return PostService.getPost($transition$.params().id);
          }
        }
      })
      .state('postUpdate', {
        url: '/post/:id/edit',
        component: 'postUpdate',
        resolve: {
          post: function(PostService, $transition$){
            return PostService.getPost($transition$.params().id);
          }
        }
      });

    var newPostState = {
      name: 'newPost',
      url: '/post/new',
      component: 'newPost'
    };

    $stateProvider.state(newPostState);
  });

  angular.module('blogApp').constant('RootUrl', 'http://localhost:3000');  
})();
