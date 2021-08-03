# frozen_string_literal: true

module GenerateTokenService
  class << self
    def call
      token = ('A'..'Z').to_a.shuffle | (1..99).to_a.shuffle | ('a'..'z').to_a.shuffle
      token.delete_at(token.index('O')) && token.delete_at(token.index('i'))
      token.shuffle.sample(149).join('')
    end
  end
end
