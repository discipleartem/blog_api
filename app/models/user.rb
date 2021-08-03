# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                                                                message: 'enter valid email' }
  validates :name, presence: false, allow_blank: true
  validates_length_of :password, minimum: 6, format: { message: 'minimum 6 characters' }

  has_many :access_tokens, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create do
    access_tokens.create(token: GenerateTokenService.call)
  end

  def access_token
    access_tokens.last
  end
end
