Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  ApplicationController
end

describe 'Getting the root of the service' do
  it 'should return ok' do
    get '/'
    last_response.must_be :ok?
  end
end

describe 'Using the countdown feature' do
  it 'should return a string with a message containing the number of days' do
    get '/countdown'
    last_response.must_be :ok?
    last_response.body.must_match(/[0-9]/)
  end
end
