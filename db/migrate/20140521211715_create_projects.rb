class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :date
      t.text :description
      t.integer :ref
      t.references :responsible, index: true
      t.integer :type

      t.timestamps
    end
  end
end
