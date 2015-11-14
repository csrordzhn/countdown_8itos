class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :viewed
      t.string :comments
      t.timestamps null:false
    end
  end
end
