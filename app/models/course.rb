class Course < ApplicationRecord
  include Schedulable
  belongs_to :user
  belongs_to :classroom
  belongs_to :service
  has_many :lessons, dependent: :restrict_with_error
  has_many :attendances, through: :lessons
  

  has_many :enrollments, inverse_of: :course, dependent: :destroy
  accepts_nested_attributes_for :enrollments, reject_if: :all_blank, allow_destroy: true

  def schedule
    schedule = IceCube::Schedule.new(now = self.start_time&.to_datetime)
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(active_days)
    )
    schedule
  end

  def to_s
    id
  end
end
