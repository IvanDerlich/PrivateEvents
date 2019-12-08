class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :creator
      t.string :description
      t.date :date
      t.timestamps
    end
  end
end
