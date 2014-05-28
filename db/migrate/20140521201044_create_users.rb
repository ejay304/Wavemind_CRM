class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :phone
      t.string :fax
      t.string :function
      t.integer :zip
      t.string :city
      t.string :country
      t.string :address

      t.timestamps
    end
  end
end
