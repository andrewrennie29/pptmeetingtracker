class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.text :fc, null: false 
      t.date :meetingdate, null: false
      t.string :meetingtype, null: false
      t.string :batchid, null: false
      t.timestamps
    end
  end
end
