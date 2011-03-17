class Relationship < ActiveRecord::Base
  attr_accessible :movie_id, :person_id, :role

  belongs_to :person
  belongs_to :movie

  scope :actor, where(:role => "actor")
  scope :director, where(:role => "director")

  validates :movie_id, :presence => true
  validates :person_id, :presence => true
end
