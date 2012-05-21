class CreateCardsets < ActiveRecord::Migration
  def change
    create_table :cardsets do |t|
      t.integer :user_id
      t.boolean :public
      t.string :category

      t.timestamps
    end
  end
end
