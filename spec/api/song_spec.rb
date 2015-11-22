require 'rails_helper'

describe "Songs" do

  # def app
  #   Rails.application
  # end

  context 'post request to /songs' do

      it 'adds song to party if party name is valid' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/songs', {
          party_name: "test_party",
          name: "test boy",
          message: "test",
          url: "test.com"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 201
      end

      it 'does not add song to party if party name is invalid' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/songs', {
          party_name: "incorrect",
          name: "test boy",
          message: "test",
          url: "test.com"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 400
      end

      it 'does not add a song to party unless url field is completed' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/songs', {
          party_name: "test_party",
          name: "test boy",
          message: "test",
          url: ""
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 400
      end

    end

    context 'get request to /songs/random/:party_name' do

      it 'returns one of the songs from specified party' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/songs', {
          party_name: "test_party",
          name: "test boy",
          message: "test",
          url: "test.com"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        get '/songs/random/test_party'
        response = JSON.parse(last_response.body)
        expect(response['url']).to eq('test.com')
      end

      it 'returns error if specified party does not exist' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/songs', {
          party_name: "incorrect",
          name: "test boy",
          message: "test",
          url: "test.com"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        get '/songs/random/test_party'
        response = JSON.parse(last_response.body)
        expect(response).to eq({"error"=>"RAVEBOT HAS NO SONGS"})
      end

    end

end
