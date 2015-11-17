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
end
