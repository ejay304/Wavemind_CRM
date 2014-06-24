class CreateAssignement < ActiveRecord::Migration
  def change
    create_table :assignements do |t|
      t.belongs_to :task
      t.belongs_to :employee
    end
  end
end
