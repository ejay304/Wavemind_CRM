class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :link
      t.date :date
      t.references :document_type, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
