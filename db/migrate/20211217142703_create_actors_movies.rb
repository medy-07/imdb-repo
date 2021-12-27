class CreateActorsMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :actors_movies do |t|
      t.references :actor
      t.references :movie
      t.string :role
      t.timestamps
    end
  end
end
