class PartysController < ApplicationController
  def create
    json = JSON.parse(request.body.read)
    party = Party.new(json)
    if party.save
      render json: party, status: 201
    else
      render json: errors, status: 400
    end
  end
end
