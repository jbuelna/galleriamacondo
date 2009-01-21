class Medium < ActiveRecord::Base
  has_many :paintings
  
  validates_length_of :name, :in => 2..30
  validates_uniqueness_of :name
end
