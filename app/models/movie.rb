class Movie < ActiveRecord::Base
  attr_accessible :name, :year, :rating, :watched, :imdb_id
end
