class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.timestamps
      t.column :first_name, :string, :limit => 25, :null => false
      t.column :last_name, :string, :limit => 25, :null => false
      t.column :email, :string, :limit => 100
      t.column :website, :string, :limit => 100  
      t.column :phone, :string, :limit => 12  
      t.column :address_line_1, :string, :limit => 30
      t.column :address_line_2, :string, :limit => 30 
      t.column :city, :string, :limit => 30
      t.column :state, :string, :limit => 2
      t.column :zip, :string, :limit => 10
      t.column :country, :string, :limit => 30
      t.column :artist_image, :string
      t.column :notes, :text
    end
  end

  def self.down
    drop_table :artists
  end
end
