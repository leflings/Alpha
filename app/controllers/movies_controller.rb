class MoviesController < ApplicationController
  before_filter :have_to_be_admin, :only => [:new, :create, :edit, :update, :destroy]
  
  def new
    @title = "New movie"
    @movie = Movie.new
    respond_to do |format|
      format.js { render_to_facebox }
    end
  end

  def create
    @movie = Movie.new(params[:movie])
    respond_to do |format|
      if @movie.save
        format.js do
          flash[:success] = "Movie created"
          redirect_from_facebox @movie
        end
      end
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
    @actors = Relationship.actor.find_all_by_movie_id(params[:id])
    @directors = Relationship.director.find_all_by_movie_id(params[:id])
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

  def add_relationship
    @rel = Relationship.new
    @movie = Movie.find_by_id(params[:id])
    @title = "Add person to #{@movie.name}"
    respond_to do |format|
      format.js { render_to_facebox }
    end
  end

end
