class SessionsController < ApplicationController

  def create

    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      redirect_to cats_url
    else
      flash[:errors]= ["Invalid username and password combination."]
      # @user = User.new(user_params)
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
