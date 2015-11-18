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
        expect(last_response.status).to eq 201
      end

    end

end
