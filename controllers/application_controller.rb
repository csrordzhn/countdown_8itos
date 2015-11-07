require 'sinatra'

class ApplicationController < Sinatra::Base
include Info8itosHelper

root = lambda do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

countdown = lambda do
  "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
end

key_dates = lambda do
  event = KeyDate.find_by_id(1)
  "#{event.description}"
end

# routes
get '/', &root
get '/countdown', &countdown
get '/key_dates', &key_dates
end
