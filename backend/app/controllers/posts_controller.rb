# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET [posts/(page/:page/:limit)]
  def index
    posts = Post.all.page(params[:page]).per(params[:limit])
    details = get_page_details(posts)
    objects = [posts: posts, details: details]

    json_response(objects)
  end

  # GET [posts/:id]
  def show
    json_response(@post)
  end

  # POST [posts]
  def create
    post = Post.create(post_params)
    json_response(post, :created)
  end

  # PATCH [posts]
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE [posts/:id]
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
