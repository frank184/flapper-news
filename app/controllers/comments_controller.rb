class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(permitted_comment_params)
    respond_with comment, location: [:post, :comments]
  end

  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.increment!(:upvotes)
    respond_with comment
  end

  private
    def permitted_comment_params
      params.require(:comment).permit(:body)
    end
end
