class AddCardsetsCardsJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :cardsets_cards, :id => false do |t|
  		t.integer :cardset_id
  		t.integer :cardset_id
  	end
  end

  def self.down
  	drop_table :cardsets_cards
  end
end
