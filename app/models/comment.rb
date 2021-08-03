# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :body, presence: true
  validates_length_of :body, maximum: 1000, format: { message: 'maximum 1 000 characters' }

  belongs_to :article
  belongs_to :user
end
