class Course < ApplicationRecord
  belongs_to :user # belongs_to takes foregn key 
  belongs_to :classroom
  belongs_to :service
  has_many :lessons # creats many lessons with primary keys
  include Scheduleable

  def schedule
    schedule = IceCube::Schedule.new
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(active_days)
    )
    schedule
  end
end
