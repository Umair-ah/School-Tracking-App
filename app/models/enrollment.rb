class Enrollment < ApplicationRecord

    belongs_to :user
    belongs_to :course

    validates_uniqueness_of :user_id, scope: :course_id
    validates_uniqueness_of :course_id, scope: :user_id

end