class Movie < ApplicationRecord
  # validates :name, presence: true
  has_many :comments
  has_many :actors_movies
  has_many :movies_reviewers
  has_and_belongs_to_many :directors
  has_and_belongs_to_many :actors
  has_many :reviewers, through: :movies_reviewers
  validates :name, presence: true, length: { minimum: 5 }
  validates :release_date, presence: true
  mount_uploader :attachment, AttachmentUploader
end
