class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.string :state
      t.references :task_type, index: true

      t.timestamps
    end
  end
end
