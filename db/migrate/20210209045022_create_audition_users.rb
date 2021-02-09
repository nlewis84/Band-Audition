class CreateAuditionUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :audition_users do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :audition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
