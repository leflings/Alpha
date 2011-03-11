class Relationship < ActiveRecord::Base
  attr_accessible :movie_id, :person_id, :role

  belongs_to :person
  belongs_to :movie
end
