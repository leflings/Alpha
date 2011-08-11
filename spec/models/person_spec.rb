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

require 'spec_helper'

describe Person do
  pending "add some examples to (or delete) #{__FILE__}"
end
