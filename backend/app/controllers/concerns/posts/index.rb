# app/controllers/posts/index.rb
class Posts::Index
  include Pagination
  attr_reader :user, :params

  def initialize(user = {}, params = {})
    @user = user
    @params = params
  end

  def call
    get_posts
  end

  private

  def get_posts
    identify = user.blank? ? Post.all : user.posts
    posts = identify
                .order(created_at: :desc)
                .page(params[:page])
                .per(params[:limit])
    pagination = get_page_details(posts)

    { base: { posts: posts, pagination: pagination }, status: :ok }
  end
end
