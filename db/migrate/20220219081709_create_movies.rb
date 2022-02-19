class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.references :user
      t.string :title, null:false     
      t.timestamps
    end
  end
end
