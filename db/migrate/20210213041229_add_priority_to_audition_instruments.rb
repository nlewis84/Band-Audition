class AddPriorityToAuditionInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :audition_instruments, :priority, :integer
  end
end
