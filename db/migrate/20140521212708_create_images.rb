class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :description
      t.string :link
      t.references :project, index: true

      t.timestamps
    end
  end
end
