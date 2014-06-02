class CreateActivityStates < ActiveRecord::Migration
  def change
    create_table :activity_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
