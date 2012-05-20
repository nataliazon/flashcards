class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.text :about
      t.string :webpage
      t.string :country
      t.boolean :active

      t.timestamps
    end
  end
end
