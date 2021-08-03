# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, maximum: 100, format: { message: 'maximum 100 characters' }
  validates :body, presence: true
  validates :category, presence: false, allow_blank: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
