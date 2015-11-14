require 'date'

module CountdownHelper

def load_messages
  msg1 = [
    'Te extraño, 8ita preciosa.',
    'Ud es lo mejor de mi vida.',
    'Eres todo lo que tengo y eres todo lo que quiero.',
    'Ud es eso que se encuentra tan solo una vez.',
    'Mi 8ita mocha, pechocha, chulis. No hay nadie en el mundo mejor para mi que tu.',
    'Falta tanto pero te amo, mi 8ita Bonita, y eso me motiva a seguir adelante.',
    'Cuando pienso en ti, la distancia entre nosotros desaparece.',
    'Ya no quiero estar tan lejos de ti, Mi 8ita Grandiosa.'
  ]

  msg2 = [
      'Ya falta poco para estar juntos de nuevo y por siempre.',
      'Estoy contando los dias para poderte tener en mis brazos',
      'Vaya alistandose para ver Alien, que ya casi nos vemos :D :D :D.',
      'Que rapido se va el tiempo cuando se tiene una persona como tu esperando al final del camino.'
    ]

  msg1.each do |message|
    new_message = Message.new(message: message, category: 'General')
    new_message.save!
  end

  msg2.each do |message|
    new_message = Message.new(message: message, category: 'T-100')
    new_message.save!
  end
end

def days_left
  deadline = Date.new(2016,8,1)
  today = Date.today
  deadline - today
end

def message
  if days_left.to_i > 100
    # msg = MSG1[rand(0..MSG1.size-1)]
    message_arr = Message.where(category: 'General').to_a
    message_arr[rand(0..message_arr.size-1)].message
  else
    # msg = MSG2[rand(0..MSG2.size-1)]
    message_arr = Message.where(category: 'T-100').to_a
    message_arr[rand(0..message_arr.size-1)].message
   end
end
end
