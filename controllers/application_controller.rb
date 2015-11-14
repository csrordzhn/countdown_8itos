require 'sinatra'
require 'hirb'
class ApplicationController < Sinatra::Base
include InitialConfig
include CountdownHelper
include EventHelper
include MessageHelper
include MovieHelper

configure do
  Hirb.enable
  set :api_ver, 'api/v1'
end

configure :development, :test do
  set :api_server, 'http://localhost:3000'
end

configure :production do
  set :api_server, 'http://countdown8itos.herokuapp.com'
end

configure :development, :production do
  enable :logging
end

root = lambda do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

countdown = lambda do
  content_type :json
  # "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
  { days_left: days_left.to_i, message: message }.to_json
end

events = lambda do
  content_type :json
  read_events
end

add_event = lambda do
  create_event
end

add_message = lambda do
  create_message
end

movies = lambda do
  content_type :json
  read_movies
end

add_movie = lambda do
  create_movie
end



# routes
get '/', &root

get '/countdown', &countdown

get '/events', &events
post '/add_event', &add_event

post '/add_message', &add_message

get '/movies', &movies
post '/add_movie', &add_movie


end
