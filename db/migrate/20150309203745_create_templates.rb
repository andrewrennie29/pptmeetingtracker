class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
			t.string :meetingtype
			t.string :notecategory
			t.string :notedetails
      t.timestamps
    end
  end
end
