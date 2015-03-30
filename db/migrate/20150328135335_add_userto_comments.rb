class AddUsertoComments < ActiveRecord::Migration
  def change
	  add_column :comments, :enteredby, :string
  end
end
