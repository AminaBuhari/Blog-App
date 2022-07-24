class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def set_comment
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to user_post_path(@comment.user_id, @comment.post_id)
  end
 
 
 
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
