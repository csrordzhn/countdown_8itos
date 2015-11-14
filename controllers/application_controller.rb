require 'sinatra'
require 'hirb'
class ApplicationController < Sinatra::Base
include InitialConfig
include CountdownHelper
include KeyDateHelper
include MessageHelper

configure do
  Hirb.enable
end

root = lambda do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

countdown = lambda do
  content_type :json
  # "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
  { days_left: days_left.to_i, message: message }.to_json
end

key_dates = lambda do
  content_type :json
  read_key_dates
end

add_key_date = lambda do
  create_key_date
end

movies = lambda do
  "Showing list of movies"
end

add_movie = lambda do
  "Add a movie to the queue list"
end

add_message = lambda do
  create_message
end

# routes
get '/', &root

get '/countdown', &countdown

get '/key_dates', &key_dates
post '/add_key_date', &add_key_date

post '/add_message', &add_message

get '/movies', &movies
post '/add_movie', &add_movie


end
