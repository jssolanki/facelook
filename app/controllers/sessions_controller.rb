class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def create
    session_params = params.permit(:email, :password)
    @user = User.find_by(emails: session_params[:email])
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = 'Login is invalid!'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to new_session_path
  end

  def new
    @user = User.new
  end

end
