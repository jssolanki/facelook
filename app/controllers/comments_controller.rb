class CommentsController < ApplicationController

  before_action :comment_data

  def comment_data
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:post_id])
    @comment = params[:id] ? @post.comments.find_by(id: params[:id]) : Comment.new
  end

  def update
    unless @comment&.update(comment_params)
      flash[:comment_error] = 'Error- please try to update an comment again.'
      redirect_to user_path(@user)
    end

    redirect_to edit_user_post_comment_path(@user, @post, @comment)
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params) do |elem|
      elem.user_id = params[:user_id]
      elem.post_id = params[:post_id]
    end
    # need to ask is there diffrent way to do this
    flash[:comment_error] = 'Error- please try to update an comment again.' unless @comment.save
    redirect_to user_path(@user)
  end

  def destroy
    
    flash[:comment_error] = 'Error- please try to delete an Comment again.' unless @comment&.destroy

    redirect_to user_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
