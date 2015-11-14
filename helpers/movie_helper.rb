require 'date'
require 'json'

module MovieHelper

  def read_movies
    Movie.all.to_json
  end

  def create_movie
    req = JSON.parse(request.body.read)
    title = req['title']
    viewed = req['viewed']
    comments = req['comments']
    new_movie = Movie.new(title: year, viewed: month, comments: day)
    if new_movie.save!
      status 201
    else
      status 500
    end
  end

end
