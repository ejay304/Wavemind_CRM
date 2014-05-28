class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.date :beginDate
      t.date :endDate
      t.integer :ref

      t.timestamps
    end
  end
end
