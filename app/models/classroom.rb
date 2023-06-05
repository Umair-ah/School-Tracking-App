class Classroom < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    has_many :courses, dependent: :restrict_with_error

    def to_s
        name
    end

   

end
