angular.module('blogApp')
  .component('home', {
    bindings: { posts: '<' },
    controller: HomeController,
    templateUrl: 'components/home/home.template.html'
  });

  function HomeController($uibModal, PostService){
    var self = this;

    self.$onInit = function(){
      console.log(self.posts[0].posts);
      console.log(self.posts[0].details);

      pPagination(self, 10, self.posts[0]);
    };

    self.pageChanged = function(){
      console.log(self.currentPage);
      var limit = 10;
      PostService.getAllPost(this.currentPage, limit).then(function(res){
        console.log(res[0].posts);
        pPagination(self, limit, res[0]);
      });
    };

    self.deletePost = function (id, title) {
      console.log(id);
      var modalInstance = $uibModal.open({
        animation: true,
        component: 'modalComponent',
        resolve: {
          postId: function () {
            console.log('PostID: '+ id);
            return id;
          },
          postTitle: function(){
            console.log('PostTitle: ' + title);
            return title;
          }
        }
      });
    };

    // self.$onInit = function(){
    //   postsFactory.getPosts().then(function(response){
    //     console.log(response.data);
    //     self.demoPosts = response.data;
    //   }, function(error){
    //     console.log(error.message);
    //     self.status = 'Unable to load customer data: ' + error.message;
    //   });
    // };
  }

  function pPagination(self, itemsPerPage, pageData){
    console.log('pagination');
    console.log(pageData.details.current_page);
    // total_pages: 12, total_objects: 119, current_page: 1, prev_page: null, next_page: 2
    self.maxSize = 5;
    self.itemsPerPage = itemsPerPage != '' ? itemsPerPage : 10;

    self.currentPage = pageData.details.current_page;
    self.totalItems = pageData.details.total_objects;
    self.numPages = pageData.details.total_pages;
    self.posts = pageData.posts;
  }
