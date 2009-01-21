class Artist < ActiveRecord::Base
  has_and_belongs_to_many :paintings
  has_many :comments
  validates_presence_of :first_name, :last_name, :email
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end