class MoviesController < ApplicationController
  def show
    @movie = Movie.find_by_id(params[:id])
    @title = @movie.name
    @aside = { :type => "movie", :content => @movie }
  end

  def index
    @title = "List of movies"
    @movies = Movie.paginate(:page => params[:page])
    @aside = {  :type => "movies",
                :content => Movie.order("rating DESC").first(10) }
  end

end
