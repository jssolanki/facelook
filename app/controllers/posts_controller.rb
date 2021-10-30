class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)

    flash[:post_error] = 'Error- please try to update an post again.' if @post.invalid?

    redirect_to edit_user_post_path(@user, @post)
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    flash[:post_error] = 'Error- please try to update an post again.' unless @post&.update(post_params)

    redirect_to edit_user_post_path(@user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    flash[:post_error] = 'Error- please try to delete an post again.' unless @post&.destroy

    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
