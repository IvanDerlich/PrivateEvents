class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.belongs_to :creator, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
