class AddAvatarToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :avatar, :string
  end
end
