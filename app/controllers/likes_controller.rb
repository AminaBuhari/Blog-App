class LikesController < ApplicationController

  def create
    set_like
    @like = current_user.likes.new(author_id: current_user.id, post_id: params[:post_id])
  
    respond_to do |format|
      if @like.save
        format.html do
        redirect_to user_post_path(@like.author_id, @like.post_id
        end
      end
    end
  end
  
    private
  
  def set_like
    @like = Like.new
  end

end
