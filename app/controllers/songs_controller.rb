class SongsController < ApplicationController

  def create
    json = JSON.parse(request.body.read)
    song = Song.new(json)
    partys = Party.all
    party_names = partys.map {|party| party.name}
    if party_names.include?(json["party_name"])
      if song.save
        render json: song, status: 201
      else
        render json: song.errors, status: 400
      end
    else
      render json: {error: "incorrect party name"}, status: 400
    end

  end

  def random
    songs = Song.all
    party_songs = []
    songs.each { |song| party_songs << song if song.party_name == params[:party_name]}
    if party_songs.empty?
      render json: {error: "RAVEBOT HAS NO SONGS"}, status: 400
    else
      render json: party_songs.sample
    end
  end

end
