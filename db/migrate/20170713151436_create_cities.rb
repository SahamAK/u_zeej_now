class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :destination, null: false
      t.string :state, null:false
      t.string :country
      t.timestamps
    end
  end
end
