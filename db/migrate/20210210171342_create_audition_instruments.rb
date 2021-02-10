class CreateAuditionInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :audition_instruments do |t|
      t.belongs_to :audition, null: false, foreign_key: true
      t.belongs_to :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
