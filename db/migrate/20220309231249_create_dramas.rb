class CreateDramas < ActiveRecord::Migration[6.1]
  def change
    create_table :dramas do |t|
      t.references :user, null:false
      t.string :title, null:false
      t.text :story
      t.timestamps
    end
  end
end
