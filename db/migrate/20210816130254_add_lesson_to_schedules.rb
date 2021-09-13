class AddLessonToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :lesson, :text
  end
end
