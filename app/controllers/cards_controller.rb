class CardsController < ApplicationController
  def show
  end

  def create
  	 @card = current_user.cards.build(params[:card])
    if @card.save
      flash[:success] = "Utworzono karte!"
      render 'show'
    else
      
            flash.now[:error] = 'Uzupelnij pola.'
      render 'new'
    end
  end
  def new
  	@card = current_user.cards.build if signed_in?
  end
end
