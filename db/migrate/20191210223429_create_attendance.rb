class CreateAttendance < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :attended_event, foreign_key: { to_table: :events }
      t.references :attendee, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
