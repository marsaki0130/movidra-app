class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.references :user, null:false
      t.string :title, null:false
      t.string :entertainment, null:false
      t.string :genre, null:false
      t.text :story
      t.float :rate
      t.timestamps
    end
  end
end
