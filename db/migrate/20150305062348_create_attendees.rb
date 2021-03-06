class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :meetingid, null: false 
      t.string :dept, null: false
      t.boolean :attendance, default: true
      t.boolean :proxy, default: false
      t.string :attendees
      t.timestamps
    end
  end
end
