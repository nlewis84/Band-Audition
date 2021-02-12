class RenameYearToDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :auditions, :year, :date
  end
end
