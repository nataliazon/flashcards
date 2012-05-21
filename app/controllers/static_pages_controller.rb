class StaticPagesController < ApplicationController
  def home
  	@cards = Card.paginate(page: params[:page],:per_page => 20)
    @cardsets = Cardset.paginate(page: params[:page],:per_page => 20)
  end

  def about
  end
end
