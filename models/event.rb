require 'sinatra'
require 'sinatra/activerecord'
require 'date'
require_relative '../config/environments'

class Event < ActiveRecord::Base
end
