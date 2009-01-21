class CreatePaintingsAndArtistsPaintings < ActiveRecord::Migration
  def self.up
    create_table :paintings do |table|
      table.timestamps
      table.column :title, :string, :limit => 255, :null => false
      table.column :medium_id, :int, :null => false
      table.column :year, :date
      table.column :length, :int, :null => false
      table.column :width, :int, :null => false
      table.column :price, :decimal, :precision => 10, :scale => 2, :default => 0.00
      table.column :location_id, :int
      table.column :painting_image, :string
      table.column :notes, :text    
    end  
    
    create_table :artists_paintings, :id => false do |table|
      table.timestamps
      table.column :artist_id, :integer, :null => false
      table.column :painting_id, :integer, :null => false
    end

    say_with_time 'Adding foreign keys' do
      #Add foreign key reference to artists_paintings table
      execute 'ALTER TABLE artists_paintings ADD CONSTRAINT fk_bk_artists FOREIGN KEY ( artist_id ) REFERENCES artists( id ) ON DELETE CASCADE'
      execute 'ALTER TABLE artists_paintings ADD CONSTRAINT fk_bk_paintings FOREIGN KEY ( painting_id ) REFERENCES paintings( id ) ON DELETE CASCADE'
    end
  end
  
  def self.down
    drop_table :artists_paintings
    drop_table :paintings
  end
end
