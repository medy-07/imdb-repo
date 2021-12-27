class Reviewer < ApplicationRecord
	has_many :movies_reviewers
	has_many :movies, through: :movies_reviewers
end
