require 'date'

module CountdownHelper

def days_left
  deadline = Date.new(2016,8,1)
  today = Date.today
  deadline - today
end

def message
  if days_left.to_i > 100
    ids = Message.where(category: 'General').map { |m| m.id }
    Message.find_by_id(ids[rand(0..ids.size-1)]).message
  else
    ids = Message.where(category: 'T-100').map { |m| m.id }
    Message.find_by_id(ids[rand(0..ids.size-1)]).message
   end
end
end
