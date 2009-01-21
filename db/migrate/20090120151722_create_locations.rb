class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.timestamps
      t.column :name, :string, :limit => 25, :null => false
      t.column :address_line_1, :string, :limit => 30
      t.column :address_line_2, :string, :limit => 30 
      t.column :city, :string, :limit => 30
      t.column :state, :string, :limit => 2
      t.column :zip, :string, :limit => 10
      t.column :country, :string, :limit => 30
      t.column :lat, :float
      t.column :lng, :float
      
    end
    
    say_with_time 'Adding foreign keys' do
      #Add foreign key reference to medium table
      execute 'ALTER TABLE paintings ADD CONSTRAINT fk_paintings_location FOREIGN KEY ( location_id ) REFERENCES locations( id ) ON DELETE CASCADE'
    end
  end

  def self.down
    drop_table :locations
  end
end
