class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null:false
      t.references :movie, null:false
      t.text :feelings, null:false
      t.text :consideration
      t.integer :star, null:false
      t.timestamps
    end
  end
end
