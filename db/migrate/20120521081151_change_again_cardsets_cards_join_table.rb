class ChangeAgainCardsetsCardsJoinTable < ActiveRecord::Migration
  def change
  	drop_table :cards_cardsets
  end
end
