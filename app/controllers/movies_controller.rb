class MoviesController < ApplicationController
  def movieIndex
    @list_of_movies = Movie.all
    render({:template=>"movie_templates/list"})

  end
  def movie_details
    movie_id = params.fetch("movie_id")
    @the_movie = Movie.where({:id =>movie_id}).at(0)
    @director = Director.where({:id=> @the_movie}).at(0)
    
    render({:template=>"movie_templates/details"})
  end
end
