class AddContactIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :contact, index: true
  end
end
