class CreateMoviesReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :movies_reviewers do |t|
      t.references :movie
      t.references :reviewer
      t.integer :review_stars
      t.timestamps
    end
  end
end
