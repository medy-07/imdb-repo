class MoviesReviewer < ApplicationRecord
	belongs_to :movie
	belongs_to :reviewer
end
