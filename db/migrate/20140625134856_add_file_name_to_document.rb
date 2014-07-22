	class AddFileNameToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :link_file_name, :string
  end
end
