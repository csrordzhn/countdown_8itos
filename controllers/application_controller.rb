require 'sinatra'
require 'hirb'
class ApplicationController < Sinatra::Base
include Info8itosHelper
include KeyDateHelper

configure do
  Hirb.enable
end

root = lambda do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

countdown = lambda do
  # "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
  { days_left: days_left.to_i, message: message }.to_json
end

show_key_dates = lambda do
  key_dates_list
end

post_key_dates = lambda do
  add_date
end

show_movies = lambda do
  "Showing list of movies"
end

post_movie = lambda do
  "Add a movie to the queue list"
end


# routes
get '/', &root

get '/countdown', &countdown

get '/key_dates', &show_key_dates
post '/add_key_date', &post_key_dates

get '/movies', &show_movies
post '/add_movie', &post_movie
end
