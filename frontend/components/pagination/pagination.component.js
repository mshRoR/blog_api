angular.module('blogApp')
  .component('pagination', {
    bindings: {
      pageInfo: '<'
    },
    // require: {
    //   homeCtrl: '^^home'
    // },
    controller: PaginationController,
    templateUrl: 'components/pagination/pagination.template.html'
  });

  function PaginationController($http, PostService){
    // current_page: 2
    // next_page:3
    // prev_page:1
    // total_objects:30
    // total_pages:3

    var self = this;
    // self.totalItems = 64;
    self.currentPage = 1;
    self.maxSize = 5;
    self.itemsPerPage = 10;

    self.$onInit = function(){
      console.log(this.pageInfo);
      self.totalItems = this.pageInfo.total_objects;
      self.numPages = this.pageInfo.total_pages;
    };

    self.pageChanged = function(){
      console.log(this.currentPage);
      PostService.getAllPost(this.currentPage).then(function(res){
      // $http.get('http://localhost:3000/posts/page/'+ this.currentPage).then(function(res){
        console.log(res);
        // self.posts = res.data[0].posts;
      });
    };

    self.setPage = function(pageNo){
      console.log(pageNo);
      self.currentPage = pageNo;
    };
  }
