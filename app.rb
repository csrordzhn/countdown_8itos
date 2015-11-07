require 'sinatra'
require_relative './helpers/info8itos_helper'

class Info8itos < Sinatra::Base
include Info8itosHelper

root = lambda do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

countdown = lambda do
  "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
end

key_dates = lambda do
  'Las fechas importantes para los 8itos van aca'
end

# routes
get '/', &root
get '/countdown', &countdown
get '/key_dates', &key_dates
end
