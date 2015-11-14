ENV['RACK_ENV'] = 'test'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  ApplicationController
end

def load_dates
  dates = [
    [2011,5,6,'8itos comienzan noviazgo.'],
    [2015,8,6,'8itos se comprometen en el restaurante El Corral.'],
    [2015,11,7, '8ito ayuda a 8ita a preparar SQL.']
  ]
  dates.each do |event|
    new_event = KeyDate.new(year: event[0], month: event[1], day: event[2], description: event[3])
    new_event.save!
  end
end

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

def load_movies
  movies = [
    ['Alien Marathon','N','Added because 8ito is a fan of Alien series'],
    ['Pixar Marathon','N','Watch Nemo, Incredibles, Up, Wall*E, Inside Out, Toy Story, Ratatouille'],
    ['Godfather','N','8ita has not watched these great movies']
  ]

  movies.each do |movie|
    new_movie = Movie.new(title: movie[0], viewed: movie[1], comments: movie[2])
    new_movie.save!
  end
end
