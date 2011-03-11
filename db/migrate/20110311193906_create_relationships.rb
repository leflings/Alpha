class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :person_id
      t.integer :movie_id
      t.string :role

      t.timestamps
    end
    add_index :relationships, :person_id
    add_index :relationships, :movie_id
    add_index :relationships, :role
  end

  def self.down
    drop_table :relationships
  end
end
