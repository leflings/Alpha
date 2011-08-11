# == Schema Information
#
# Table name: movies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  year       :integer
#  rating     :integer
#  watched    :boolean
#  imdb_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Movie do
  pending "add some examples to (or delete) #{__FILE__}"
end
