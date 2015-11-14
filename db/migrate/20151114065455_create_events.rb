class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.integer :year
      t.integer :month
      t.integer :day
      t.timestamps null:false
    end
  end
end
