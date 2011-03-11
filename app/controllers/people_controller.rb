class PeopleController < ApplicationController
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

end
