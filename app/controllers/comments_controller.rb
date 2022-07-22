class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def set_comment
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
  end

  def create
    @comment = current_user.comments.new(comment_params)
    set_comment

    respond_to do |_format|
      if @comment.save
        puts @comment
        redirect_to user_posts_path(current_user)
      else
        render :new
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
