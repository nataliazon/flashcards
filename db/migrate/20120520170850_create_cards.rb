class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :term
      t.integer :user_id
      t.text :definition
      t.boolean :public

      t.timestamps
    end
    add_index :cards, [:user_id, :created_at]
  end

end
