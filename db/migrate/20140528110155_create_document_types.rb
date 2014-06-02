class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :name
      t.text :name
      t.string :ref

      t.timestamps
    end
  end
end
