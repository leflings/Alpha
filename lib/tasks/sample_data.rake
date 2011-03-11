require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    99.times do |n|
      name  = Faker::Company.name
      year = 1900+rand(111)
      rating = 1+rand(10)
      watched = (1 == rand(2) ? true : false)
      imdb_id = rand(1000000)
      Movie.create!(:name => name,
                    :year => year,
                    :rating => rating,
                    :watched => watched,
                    :imdb_id => imdb_id)
    end
    50.times do |n|
      name = Faker::Name.name
      birthdate = Time.utc(1930+rand(60), 1+rand(12), 1+rand(31))
      imdb_id = rand(1000000)
      Person.create!(:name => name,
                     :birthdate => birthdate,
                     :imdb_id => imdb_id)
    end
  end
end

