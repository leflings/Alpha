# == Schema Information
#
# Table name: relationships
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  movie_id   :integer
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Relationship < ActiveRecord::Base
  attr_accessible :movie_id, :person_id, :role

  belongs_to :person
  belongs_to :movie

  scope :actor, where(:role => "actor")
  scope :director, where(:role => "director")

  validates :movie_id, :presence => true
  validates :person_id, :presence => true
end
