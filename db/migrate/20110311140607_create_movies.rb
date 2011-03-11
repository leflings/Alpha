class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.integer :rating
      t.boolean :watched
      t.integer :imdb_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
