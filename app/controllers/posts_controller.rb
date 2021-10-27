class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)

    if @post.invalid?
      flash[:post_error] = 'Error- please try to update an post again.'
    end

    redirect_to edit_user_post_path(@user, @post)
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    unless @post&.update(post_params)
      flash[:post_error] = 'Error- please try to update an post again.'
    end

    redirect_to edit_user_post_path(@user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    unless @post&.destroy
      flash[:post_error] = 'Error- please try to delete an post again.'
    end

    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
