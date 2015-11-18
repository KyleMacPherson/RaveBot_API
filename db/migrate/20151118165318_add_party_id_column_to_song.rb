class AddPartyIdColumnToSong < ActiveRecord::Migration
  def change
    add_column :songs, :party_id, :integer
  end
end
