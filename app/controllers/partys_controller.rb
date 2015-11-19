class PartysController < ApplicationController

  def create
    json = JSON.parse(request.body.read)
    party = Party.new(json)
    if party.save
      render json: party, status: 201
    else
      render json: party.errors, status: 400
    end
  end

  def show
    party = Party.find_by_name(params[:name])
    if party
      render json: party, status: 200
    else
      render json: {error: "RAVEBOT HAS NOT BEEN INVITED TO THIS PARTY"}
    end
  end

end
