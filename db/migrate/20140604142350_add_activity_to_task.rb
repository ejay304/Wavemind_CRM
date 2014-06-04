class AddActivityToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :activity, index: true
  end
end
