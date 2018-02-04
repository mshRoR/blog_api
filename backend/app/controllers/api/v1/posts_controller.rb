# app/controllers/api/v1/posts_controller.rb
module Api::V1
  class PostsController < ApplicationController
    before_action :authenticate_request, except: %i[index show]
    include CheckPermission
    before_action :set_post, only: %i[show update destroy]

    # GET    /api/v1/posts(/page/:page/:limit)
    def index
      results = Posts::Index.new(current_user, params).call

      json_response(results[:base], results[:status])
    end

    # GET    /api/v1/posts/:id
    def show
      json_response(@post)
    end

    # POST   /api/v1/posts
    def create
      post = current_user.posts.create(post_params)
      json_response(post, :created)
    end

    # PATCH/PUT  /api/v1/posts/:id
    def update
      @post.update(post_params)
      head :no_content
    end

    # DELETE /api/v1/posts/:id
    def destroy
      @post.destroy
      head :no_content
    end

    private

    def post_params
      params.require(:post).permit(:title, :description)
    end

    def set_post
      @post = Post.find(params[:id])

      return @post unless @post.nil?
      json_response({ error: 'request post is not found' }, :not_found)
    end
  end
end
