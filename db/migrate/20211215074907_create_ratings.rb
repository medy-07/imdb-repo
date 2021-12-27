class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :movie
      t.references :reviewer
      t.integer :review_stars
      t.timestamps
    end
  end
end
