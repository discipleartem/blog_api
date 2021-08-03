# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

Dir[Rails.root.join('spec/acceptance/support/**/*.rb')].each { |f| require f }

RspecApiDocumentation.configure do |config|
  config.format = [:json]
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'Blog API'

  config.curl_headers_to_filter = %w[Cookie Host]
  config.request_headers_to_include = %w[Content-Type Accept Authorization]
  config.response_headers_to_include = %w[Content-Type Accept Authorization Content-Length]
  config.docs_dir = Rails.root.join('public/docs/api')
  config.configurations_dir = Rails.root.join('config')

  config.request_body_formatter = proc { |params| params }
  config.response_body_formatter = proc { |_response_content_type, response_body| response_body }
end
