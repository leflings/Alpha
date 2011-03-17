class Movie < ActiveRecord::Base
  attr_accessible :name, :year, :rating, :watched, :imdb_id

  has_many :relationships, :dependent => :destroy
  has_many :people, :through => :relationships
  has_many :actors, :through => :relationships, :class_name => "Person", :conditions => ['relationships.role = ?', "actor"], :source => :person
  has_many :directors, :through => :relationships, :class_name => "Person", :conditions => ['relationships.role = ?', "director"], :source => :person


  scope :acted, :conditions => ['relationships.role = ?', "actor"] 
  scope :directed, :conditions => ['relationships.role =?', "director"] 
end
