class User < ApplicationRecord
	has_many :articles

	validates :name, presence: true
	validates :age, presence: true
end
