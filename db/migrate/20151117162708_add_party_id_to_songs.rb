class AddPartyIdToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :party, index: true, foreign_key: true
  end
end
