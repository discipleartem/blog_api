# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
  include ActiveSupport::Testing::FileFixtures
  # include ActiveStorageHelpers

  # self.file_fixture_path = "#{::Rails.root}/spec/fixtures/files"
end
