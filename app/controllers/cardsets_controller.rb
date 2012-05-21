class CardsetsController < ApplicationController
  def new
  	@cardset = current_user.cardsets.build if signed_in?
  end

  def create
  	@cardset = current_user.cardsets.build(params[:cardset])

    if @cardset.save
      flash[:success] = "Utworzono set!"
      render 'show'
    else
      
            flash.now[:error] = 'Uzupelnij pola.'
      render 'new'
    end
  end

  def show
  	@cardset =  Cardset.find(params[:id])
  	@cards = @cardset.cards.paginate(page: params[:page],:per_page => 15)
  end
end
