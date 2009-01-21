class Painting < ActiveRecord::Base
  file_column :painting_image, :magick => { :versions => { "thumb" => "125x125", "medium" => "200x200", "large" => "350x350"}}
  
  has_and_belongs_to_many :artists
  has_many :comments
  belongs_to :medium
  belongs_to :location
  
  validates_length_of :title, :in => 1..255
  validates_presence_of :artists
  validates_presence_of :medium_id
  validates_numericality_of :price
  validates_numericality_of :length
  validates_numericality_of :width
  
  define_index do
    indexes title
    indexes medium.name
    indexes [artists.first_name, artists.last_name], :as => :artists_name
  end
  
  def caption
    "#{title.upcase} - #{artists.map{ |a| a.name }}"
  end

  def truncated_title
    if title.size > 18
      "#{title[0..18]}..."
    else
      "#{title}"
    end
  end
    
  def size
    "#{length.to_s} x #{width.to_s}"
  end
  
  def self.search_all(page)
    paginate :per_page => 6, :page => page, :conditions => 'painting_image IS NOT NULL'
  end

  def self.latest
    find :all, :limit => 10, :order => "created_at", :include => [:artists, :medium]
  end
  
end
