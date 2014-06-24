class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :task, index: true
      t.references :employee, index: true

      t.timestamps
    end
  end
end
