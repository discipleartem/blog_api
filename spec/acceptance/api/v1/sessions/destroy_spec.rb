# frozen_string_literal: true

require 'acceptance_helper'

RSpec.describe '/api/v1/sign_out', type: :request do
  let!(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end
  let(:headers) do
    { 'Accept' => 'application/json', 'Content' => 'application/json; charset=utf-8',
      'Authorization' => user.access_token }
  end
  let(:raw_post) { params.to_json }

  context 'User sign_out' do
    it 'with access_token' do
      post '/api/v1/sign_out', params: params, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:accepted)
    end

    # it 'with wrong parameters' do
    #   post '/api/v1/sign_up', params: { registration: { password: Faker::Internet.password } }, headers: headers
    #   expect(user.save!).to raise_error("Validation failed: Email can't be blank, Email enter valid email")
    # end
  end
end
