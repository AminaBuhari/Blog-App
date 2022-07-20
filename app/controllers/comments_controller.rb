class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post_id = params[:post_id]
    @user_id = current_user.id
  end

  def set_comment
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
  end

  def create
    @comment = Comment.new(comment_params)
    set_comment
    @comment.user = current_user
      if @comment.save
        puts @comment
        redirect_to user_posts_path(current_user, :post_id)
      else
        render :new
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
