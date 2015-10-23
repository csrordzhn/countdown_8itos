require 'sinatra'
require_relative './helpers/countdown_helper'

class CountDown < Sinatra::Base
include CountDownHelper

get '/' do
  "'Countdown, counting every minute you're away' - Dan Hartman"
end

get '/countdown' do
  "Faltan #{days_left.to_i} dias para volverte a ver. #{message}"
end

end
