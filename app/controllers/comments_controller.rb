class CommentsController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    unless @comment&.update(comment_params)
      flash[:comment_error] = 'Error- please try to update an comment again.'
      redirect_to user_path(@user)
    end

    redirect_to edit_user_post_comment_path(@user, @post, @comment)
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new(comment_params) do |elem|
      elem.user_id = params[:user_id]
      elem.post_id = params[:post_id]
    end
    # need to ask is there diffrent way to do this
    flash[:comment_error] = 'Error- please try to update an comment again.' unless @comment.save
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    unless @comment&.destroy
      flash[:comment_error] = 'Error- please try to delete an Comment again.'
    end

    redirect_to user_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
