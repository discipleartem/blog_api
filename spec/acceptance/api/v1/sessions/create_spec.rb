# frozen_string_literal: true

require 'acceptance_helper'

RSpec.describe '/api/v1/sign_in', type: :request do
  let!(:user) { create :user }
  let(:params) do
    {
      session: {
        email: user.email,
        password: user.password
      }
    }.as_json
  end
  let(:headers) do
    { 'Accept' => 'application/json', 'Content' => 'application/json; charset=utf-8' }
  end

  context 'Login user' do
    it 'with good params' do
      post '/api/v1/sign_in', params: params, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:accepted)
    end

    # it 'with wrong parameters' do
    #   post '/api/v1/sign_in', params: { session: { password: user.password } }, headers: headers
    #   expect { user.blank? }.to raise_error(StandardError)
    # end
  end
end
