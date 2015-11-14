module InitialConfig

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
end
