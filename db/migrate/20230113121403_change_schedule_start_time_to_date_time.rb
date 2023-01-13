class ChangeScheduleStartTimeToDateTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :star_time
    add_column :courses, :start_time, :datetime
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
