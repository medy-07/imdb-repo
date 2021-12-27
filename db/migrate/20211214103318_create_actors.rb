class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :f_name
      t.string :l_name
      t.string :gender
      t.timestamps
    end
  end
end
