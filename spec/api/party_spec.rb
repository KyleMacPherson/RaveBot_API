require 'rails_helper'

describe "Users" do

  # def app
  #   Rails.application
  # end

  context 'post request to /partys' do

    context 'with party name' do

      it 'creates new party if party name is neither blank nor already taken' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 201
        expect(Party.all.count).not_to be(0)
      end

      it 'if party name is already taken it returns an error' do
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        post '/partys', {
          name: "test_party"
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 400
        expect(Party.all.count).to eq(1)
      end

      it 'if party name blank it returns an error' do
        post '/partys', {
          name: ""
        }.to_json, {"CONTENT_TYPE" => 'application/json'}
        expect(last_response.status).to eq 400
        expect(Party.all.count).to eq(0)
      end

    end

  end

end
