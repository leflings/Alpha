class Movie < ActiveRecord::Base
  attr_accessible :name, :year, :rating, :watched, :imdb_id

  has_many :relationships
  has_many :people, :through => :relationships
  has_many :roles, :through => :relationships

  scope :acted, :conditions => ['relationships.role = ?', "actor"] 
  scope :directed, :conditions => ['relationships.role =?', "director"] 
end
