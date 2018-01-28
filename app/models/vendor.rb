class Vendor < ApplicationRecord
	has_many :orders
	belongs_to :user
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true, length: {minimum: 10}

end
