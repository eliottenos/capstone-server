class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :country
      t.string :note

      t.timestamps
    end
  end
end
