class PeopleController < ApplicationController
  before_filter :have_to_be_admin, :only => [:new, :create, :edit, :update, :destroy]

  def new
    @title = "New person"
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      flash[:success] = "Person created"
      redirect_to @person
    else
      render 'new'
    end
  end

  def index
    @people = Person.all
    @title = "List of people"
    @aside = { :type => "people",
              :content => Person.order("birthdate").first(10) }
  end

  def show
    @person = Person.find_by_id(params[:id])
    @title = @person.name
  end

  def edit
    @person = Person.find_by_id(params[:id])
    @title = "Edit #{@person.name}"
  end

  def update
    @person = Person.find_by_id(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice => "Person info updated"
    else
      @title = "Edit person"
      render 'edit'
    end
  end

  def destroy
    if Person.find_by_id(params[:id]).destroy
      redirect_to people_path, :notice => "Person deleted."
    end
  end

end
