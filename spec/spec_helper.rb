require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'signatureio'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  config.before(:suite) do
    # FakeWeb.allow_net_connect = false
  end

  # config.after(:suite) do
  #   FakeWeb.allow_net_connect = true
  # end
end

def set_secret_and_public_api_keys!
  # These keys come form rspec@signature.io person.
  Signatureio.secret_api_key = ENV['SIGNATURE_SECRET_API_KEY']
  Signatureio.public_api_key = ENV['SIGNATURE_PUBLIC_API_KEY']
end