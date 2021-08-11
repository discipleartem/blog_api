# frozen_string_literal: true

require 'acceptance_helper'

RSpec.describe 'api/v1/sign_up', type: :request do
  let(:params) do
    { registration: {
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password
    } }.as_json
  end
  let(:invalid_params) do
    { registration: {
      password: Faker::Internet.password
    } }.as_json
  end
  let(:headers) do
    { 'Accept' => 'application/json', 'Content' => 'application/json; charset=utf-8' }
  end

  context 'Create new user' do
    it 'with good params' do
      post '/api/v1/sign_up', params: params, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:created)
    end

    it 'with wrong parameters' do
      post '/api/v1/sign_up', params: invalid_params, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
