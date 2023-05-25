class Course < ApplicationRecord
  include Schedulable
  belongs_to :user
  belongs_to :classroom
  belongs_to :service
end
