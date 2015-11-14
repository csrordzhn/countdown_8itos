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
    last_response.headers['Content-Type'].must_equal 'application/json'
  end

describe 'Testing Key Dates Feature' do
  it 'should return a list of the key dates' do
    get '/key_dates'
    last_response.status.must_equal 200
    last_response.body.wont_equal ''
  end

  it 'should add a new event to the db' do
    today = Date.today
    body = {
      year: today.year,
      month: today.month,
      day: today.day,
      desc: 'running some more tests'
    }

    headers = { 'Content-Type' => 'application/json' }

    post '/add_key_date', body.to_json, headers
    last_response.status.must_equal 201
  end
end
end
