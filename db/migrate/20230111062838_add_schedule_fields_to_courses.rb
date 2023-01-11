class AddScheduleFieldsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :star_time, :time
    add_column :courses, :days, :jsonb, null: false, default: {}
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
