class MoviesController < ApplicationController
  def show
    @title = "Specific movie"
  end

  def list
    @title = "List of movies"
  end

end
