class AddScheduleFieldsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :start_time, :time
    add_column :courses, :days, :jsonb, null: false, default: {}
  end
end
