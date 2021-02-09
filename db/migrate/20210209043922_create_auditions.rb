class CreateAuditions < ActiveRecord::Migration[6.1]
  def change
    create_table :auditions do |t|
      t.string :school
      t.datetime :year
      t.string :code

      t.timestamps
    end
  end
end
