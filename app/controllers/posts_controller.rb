class PostsController < ApplicationController

  before_action :post_data

  def post_data
    @user = User.find_by(id: params[:user_id])
    @post = params[:id] ? @user.posts.find_by(id: params[:id]) : Post.new
  end

  def create
    @post = @user.posts.create(post_params)

    flash[:post_error] = 'Error- please try to update an post again.' if @post.invalid?
    if @post.valid?
      redirect_to edit_user_post_path(@user, @post)
    else
      redirect_to user_path(@user)
    end
  end

  def new
  end

  def edit
  end

  def update
    flash[:post_error] = 'Error- please try to update an post again.' unless @post&.update(post_params)

    redirect_to edit_user_post_path(@user, @post)
  end

  def destroy
    flash[:post_error] = 'Error- please try to delete an post again.' unless @post&.destroy

    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
