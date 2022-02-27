class CreateSpoilers < ActiveRecord::Migration[6.1]
  def change
    create_table :spoilers do |t|
      t.references :movie, null:false
      t.text :content
      t.timestamps
    end
  end
end
