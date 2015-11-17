class RemovePartyIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :party_id, :string
  end

  def 
end
