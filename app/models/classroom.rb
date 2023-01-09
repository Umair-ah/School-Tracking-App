class Classroom < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :name, uniqueness: { case_sensitive: false }
end
