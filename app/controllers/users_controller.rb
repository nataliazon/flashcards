class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cards = @user.cards.paginate(page: params[:page],:per_page => 5)
    @cardsets = @user.cardsets
  end
  def new
  	@user = User.new
  end

  def create
  	 @user = User.new(params[:user])
    if @user.save
      zaloguj @user
      flash[:success] = "Witaj w aplikacji Kerbo!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
