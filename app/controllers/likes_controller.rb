class LikesController < ApplicationController
  def create
    @like = likable_type_data.likes.find_by(user_id: params[:user_id])

    if @like
      @like.destroy
    else
      @like = likable_type_data.likes.create(user_id: params[:user_id])
    end

    redirect_to user_path(current_user)
  end

  private

  def likable_type_data
    if params[:post_id]
      Post.find_by(id: params[:post_id])
    else
      Comment.find_by(id: params[:comment_id])
    end
  end
end
