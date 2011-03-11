class Person < ActiveRecord::Base
  attr_accessible :name, :birthdate, :imdb_id
end
