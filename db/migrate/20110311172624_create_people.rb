class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.timestamp :birthdate
      t.integer :imdb_id

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
