class AddAssignedToDueDateToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :assignedto, :string
    add_column :notes, :duedate, :date
  end
end
