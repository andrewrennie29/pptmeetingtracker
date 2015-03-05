class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :meetingid, null: false 
      t.string :notetype, null: false
      t.string :notetag, null: false
      t.string :details 
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
