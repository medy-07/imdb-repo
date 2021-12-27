class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.string :f_name
      t.string :l_name
      t.timestamps
    end
  end
end
