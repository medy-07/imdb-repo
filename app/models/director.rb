class Director < ApplicationRecord
	has_and_belongs_to_many :movies
	validates :f_name, presence: true
	validates :l_name, presence: true
end
