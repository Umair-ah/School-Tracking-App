class Service < ApplicationRecord
    has_many :courses, dependent: :restrict_with_error
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :duration, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180 }
    monetize :client_price, as: :client_price_cents
end
