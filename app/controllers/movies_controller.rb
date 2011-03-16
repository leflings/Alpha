class MoviesController < ApplicationController
  before_filter :have_to_be_admin, :only => [:edit, :update, :destroy]
  
  def show
    @movie = Movie.find_by_id(params[:id])
    @title = @movie.name
  end

  def index
    @title = "List of movies"
    @movies = Movie.paginate(:page => params[:page])
  end

  def edit
    @movie = Movie.find_by_id(params[:id])
    @title = "Edit #{@movie.name}"
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:success] = "Movie info updated"
      redirect_to @movie
    else
      @title = "Edit movie"
      render 'edit'
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = "Movie deleted."
    redirect_to movies_path
  end

end
