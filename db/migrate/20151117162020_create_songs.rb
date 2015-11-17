class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :url
      t.string :message
      t.string :name

      t.timestamps null: false
    end
  end
end
