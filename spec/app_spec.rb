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
  it 'should return a json string' do
    get '/countdown'
    last_response.must_be :ok?
    last_response.headers['Content-Type'].must_equal 'application/json'
  end

  it 'should include the numbers of days left' do
    deadline = Date.new(2016,8,1)
    today = Date.today
    days = (deadline - today).to_i
    get '/countdown'
    JSON.parse(last_response.body)['days_left'].must_equal days
  end

  it 'should include a message' do
    deadline = Date.new(2016,8,1)
    today = Date.today
    days = (deadline - today).to_i
    get '/countdown'
    JSON.parse(last_response.body)['message'].must_be_kind_of String
    JSON.parse(last_response.body)['message'].size.must_be :>, 0
  end
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


describe 'Testing messages feature' do

  #it 'should load messages from array into db' do

  #end

  it 'should create a message in the database' do
    body = {
      message: 'mi pedacito de cielo, pienso en ti donde sea que voy',
      cat: 'General',
    }

    headers = { 'Content-Type' => 'application/json' }

    post '/add_message', body.to_json, headers
    last_response.status.must_equal 201
  end


end
