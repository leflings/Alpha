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

require 'spec_helper'

describe Relationship do
  pending "add some examples to (or delete) #{__FILE__}"
end
