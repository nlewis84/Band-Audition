class CreateGuardians < ActiveRecord::Migration[6.1]
  def change
    create_table :guardians do |t|
      t.string :name
      t.belongs_to :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
