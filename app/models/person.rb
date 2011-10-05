# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  birthdate  :datetime
#  imdb_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  attr_accessible :name, :birthdate, :imdb_id

  has_many :relationships, :dependent => :destroy
  has_many :movies, :through => :relationships
  has_many :movies_directed, :through => :relationships, :class_name => "Movie",
    :conditions => ['relationships.role = ?', "director" ], :source => :movie
  has_many :movies_acted, :through => :relationships, :class_name => "Movie",
    :conditions => ['relationships.role = ?', "actor"], :source => :movie
  
  scope :acting, :conditions => ['relationships.role = ?', "actor"] 
  scope :directing, :conditions => ['relationships.role = ?', "director"] 
end
