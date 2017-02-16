class UsersController < ApplicationController
  before_action(:on => :create) do
    redirect_to cats_url unless current_user.nil?
  end
  
  def new
    @user = User.new
    render :new
    #signup page
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      current_user
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
