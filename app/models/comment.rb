class Comment < ApplicationRecord
  belongs_to :movie
  validates :commenter, presence: true
  validates :body, presence: true
end
