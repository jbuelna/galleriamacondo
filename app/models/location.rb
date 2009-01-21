class Location < ActiveRecord::Base
  has_many :paintings
  validates_presence_of :name, :address_line_1, :city, :state, :zip, :lat, :lng
  
  before_validation_on_create :geocode_address
  before_validation_on_update :geocode_address
  
  def address
    "#{address_line_1} #{address_line_2}, #{city}, #{state}"
  end
  
  def geocode_address
    logger.debug("Test")
    geo = GeoKit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:address, "Could not geocode address") unless geo.success
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end
end
