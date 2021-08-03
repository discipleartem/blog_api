# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'email@example.com' }
    password { '123456' }

    after :create do |obj|
      obj.access_tokens.create { GenerateTokenService.call }
    end
  end
end
