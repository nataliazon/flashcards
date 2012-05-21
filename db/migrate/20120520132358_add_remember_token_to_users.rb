class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	drop_table :cardsets_cards
  end
end
