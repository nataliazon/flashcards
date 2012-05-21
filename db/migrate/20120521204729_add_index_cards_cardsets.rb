class AddIndexCardsCardsets < ActiveRecord::Migration
  def change
    add_index :cards_cardsets, [:card_id, :cardset_id], :unique=>true
   end
end
