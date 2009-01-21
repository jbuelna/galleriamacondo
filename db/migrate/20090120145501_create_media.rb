class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.timestamps
      t.string :name
    end

    say_with_time 'Adding foreign keys' do
      #Add foreign key reference to medium table
      execute 'ALTER TABLE paintings ADD CONSTRAINT fk_paintings_media FOREIGN KEY ( medium_id ) REFERENCES media( id ) ON DELETE CASCADE'
    end
  end

  def self.down
    drop_table :media
  end
end
