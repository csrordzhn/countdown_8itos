module MessageHelper

  def create_message
    req = JSON.parse(request.body.read)
    message = req['message']
    category = req['cat']
    new_message = Message.new(message: message, category: category)
    if new_message.save!
      status 201
    else
      status 500
    end
  end
end
