require 'sinatra'
require 'sinatra/activerecord'
require 'date'
require_relative '../config/environments'

class KeyDate < ActiveRecord::Base
  def to_json
    event_date = Date.new(self.year, self.month, self.day)
    { event_date: event_date, description: self.description }.to_json
  end
end
