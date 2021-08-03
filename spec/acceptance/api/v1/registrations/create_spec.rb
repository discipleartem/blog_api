# frozen_string_literal: true

require 'acceptance_helper'

RSpec.describe '/api/v1/sign_up', type: :request do
  let(:registration_params) do
    {
      registration: {
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password
      }
    }
  end
  let(:headers) do
    { 'Accept' => 'application/json', 'Content' => 'application/json; charset=utf-8' }
  end
  let(:raw_post) { params.to_json }

  context 'Create new user' do
    it 'with good params' do
      post '/api/v1/sign_up', params: registration_params, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:created)
    end

    # it 'with wrong parameters' do
    #   post '/api/v1/sign_up', params: { registration: { password: Faker::Internet.password } }, headers: headers
    #   expect(user.save!).to raise_error("Validation failed: Email can't be blank, Email enter valid email")
    # end
  end
end
