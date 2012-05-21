class ChangeCardsetsCardsJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :cards_cardsets, :id => false do |t|
  		t.integer :cardset_id
  		t.integer :card_id
  	end
  end

  def self.down
  	drop_table :cards_cardsets
  end
end
