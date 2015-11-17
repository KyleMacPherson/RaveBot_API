class AddColumnToSong < ActiveRecord::Migration
  def change
    add_column :songs, :party_name, :string
  end
end
