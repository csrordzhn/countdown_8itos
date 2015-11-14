require 'date'
require 'json'

module EventHelper

def read_events
  Event.all.to_json
end

def create_event
  req = JSON.parse(request.body.read)
  year = req['year']
  month = req['month']
  day = req['day']
  desc = req['desc']
  new_event = Event.new(year: year, month: month, day: day, description: desc)
  if new_event.save!
    status 201
  else
    status 500
  end

end
end
