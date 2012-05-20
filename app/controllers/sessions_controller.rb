class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      zaloguj user
      redirect_to user
    else
      flash.now[:error] = 'Podano zle dane.'
      render 'new'
    end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
