require 'date'
require 'json'

module KeyDateHelper

def key_dates_list
  KeyDate.all.to_json
end

def add_date
  req = JSON.parse(request.body.read)
  year = req['year']
  month = req['month']
  day = req['day']
  desc = req['desc']
  new_event = KeyDate.new(year: year, month: month, day: day, description: desc)
  if new_event.save!
    status 201
  else
    status 500
  end

end
end
