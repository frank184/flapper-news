class PostsController < ApplicationController

  def index
    respond_with Post.all.includes(:comments)
  end

  def create
    respond_with Post.create(permitted_post_params)
  end

  def show
    respond_with Post.find(params[:id])
  end

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    respond_with post
  end

  private
    def permitted_post_params
      params.require(:post).permit(:title, :link)
    end
end
