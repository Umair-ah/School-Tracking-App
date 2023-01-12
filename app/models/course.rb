class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :service
  include Scheduleable

  def schedule
    schedule = IceCube::Schedule.new
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(active_days)
    )
    schedule
  end
end
