class ChangeCardsetsTable < ActiveRecord::Migration
  def change
  	 add_column :cardsets, :name, :string
  end
end
