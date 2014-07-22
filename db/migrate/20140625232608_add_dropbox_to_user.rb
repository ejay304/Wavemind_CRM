class AddDropboxToUser < ActiveRecord::Migration
  def change
    add_column :users, :db_token, :string
    add_column :users, :db_secret, :string
  end
end
