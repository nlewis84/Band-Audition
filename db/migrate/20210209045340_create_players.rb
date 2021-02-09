class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :virtual
      t.string :comment
      t.string :first_choice
      t.string :second_choice
      t.string :thrid_choice
      t.belongs_to :audition, null: false, foreign_key: true
      t.belongs_to :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
