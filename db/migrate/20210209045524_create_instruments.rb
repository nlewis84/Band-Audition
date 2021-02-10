class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :available_spots

      t.timestamps
    end
  end
end
