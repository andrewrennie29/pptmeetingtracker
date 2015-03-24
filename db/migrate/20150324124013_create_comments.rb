class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
			t.integer :meetingid
			t.integer :noteid
      t.timestamps
    end
  end
end
