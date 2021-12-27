class AddCityToActor < ActiveRecord::Migration[6.1]
  def change
    add_reference :actors, :city
  end
end
