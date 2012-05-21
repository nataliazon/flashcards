class CardsController < ApplicationController
  def show
    @card =  Card.find(params[:id])
  end

  def create
     
  	 @card = current_user.cards.build(params[:card])

     @cardset = Cardset.find_by_id(params[:cardset][:id])
    if @cardset != nil  
       @card.cardsets<<@cardset
    end
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

  def update
    @card =  Card.find(params[:id])
    @cardset = Cardset.find_by_id(params[:cardset][:id])
    if (@card.cardsets.find_by_id(@cardset.id)==nil)
      if @cardset != nil  
         @card.cardsets<<@cardset
         flash[:success] = "Karta zostala dodana"
         render 'show'
      else
         flash.now[:error] = 'Cos poszlo nie tak.'
         render 'show'     
      end
    else
      
         flash.now[:error] = 'Karta juz jest w tym secie.'
         render 'show'
    end


  end
end
