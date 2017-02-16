class SessionsController < ApplicationController
  before_action(:on => :create) do
    redirect_to cats_url unless current_user.nil?
  end

  def new
    @user = User.new
    render :new
    #login page
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    unless user.nil?
      login_user!(user)
    else

      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
    nil
  end

  def destroy
    @current_user.reset_session_token! if @current_user
    session[:session_token] = nil
    @current_user = nil
  end
end
