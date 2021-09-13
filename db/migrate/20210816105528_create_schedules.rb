class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.text :title
      t.text :day
      t.text :lecture
      t.text :lesson
      t.integer :room


      t.timestamps
    end
  end
end
