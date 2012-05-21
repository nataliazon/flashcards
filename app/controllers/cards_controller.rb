class CardsController < ApplicationController
  def show
    @card =  Card.find(params[:id])
  end

  def create
     
  	 @card = current_user.cards.build(params[:card])
     @cardset = Cardset.find_by_id(params[:cardset][:id])

     
     @card.cardsets<<@cardset
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
