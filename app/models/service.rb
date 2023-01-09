class Service < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :name, uniqueness: { case_sensitive: false }
    validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180 }
    validates :client_price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
end
