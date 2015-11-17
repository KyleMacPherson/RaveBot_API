class SongsController < ApplicationController

  def create
    json = JSON.parse(request.body.read)
    song = Song.new(json)
    if song.save
      render json: song, status: 201
    else
      render json: song.errors, status: 400
    end
  end

  def random
    songs = Song.all
    party_songs = []
    songs.each do |song|
      party_songs << song if song.party_name == params[:party_name]
    end
    render json: party_songs.sample
  end
end
