class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.timestamps
      t.integer :painting_id
      t.integer :artist_id
      t.text :body
    end
  end

  def self.down
    drop_table :comments
  end
end
