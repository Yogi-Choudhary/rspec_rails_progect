require 'rails_helper'

RSpec.describe "Api::V1::UsersController", type: :request do

  let(:valid_params) do
    {
      name: "John",
      age: 25
    }
  end
  let(:invalid_params) do
    {
      name: nil,
      age: nil
    }
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/api/v1/users/'
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.create(valid_params)
      get "/api/v1/users/#{user.id}", params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        post '/api/v1/users/', params: { user: valid_params }
        expect(response).to have_http_status(:created)
      end
    end
    context 'with invalid parameters' do
      it 'returns unprocessable entity status' do 
        post '/api/v1/users/', params: { user: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
        message = JSON.parse(response.body)
        puts "#{message}"
      end
    end
  end

  describe "Put#edit" do
    let(:user) { User.create(valid_params) }
    let(:params) do
      {
        user: {
          name: "accepted_name"
        }
      }
    end
    it "edits accepted_name" do
      put "/api/v1/users/#{user.id}", params: params
      expect(response).to have_http_status(200)
    end
    let(:user) { User.create(valid_params) }
    let(:params) do
      {
        user: {
          name: "accepted_name"
        }
      }
    end
    it "redirects to the users list" do
      put "/api/v1/users/#{user.id}", params: params
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create(valid_params)
      delete "/api/v1/users/#{user.id}", headers: @headers
      expect(response).to have_http_status(:success)
    end
    it "redirects to the users list" do
      user = User.create(valid_params)
      delete "/api/v1/users/#{user.id}", params: { id: user.to_param }
      expect(response).to have_http_status(204)
    end
  end
end