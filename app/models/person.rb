class Person < ActiveRecord::Base
  attr_accessible :name, :birthdate, :imdb_id

  has_many :relationships, :dependent => :destroy
  has_many :movies, :through => :relationships
  
  scope :acting, :conditions => ['relationships.role = ?', "actor"] 
  scope :directing, :conditions => ['relationships.role =?', "director"] 
end
