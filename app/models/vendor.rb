class Vendor < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true, length: {minimum: 10}
end
