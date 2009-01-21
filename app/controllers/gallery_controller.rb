class GalleryController < ApplicationController

  def index
    @page_title = "The Gallery"
    flash[:notice] = ""
    if params[:search]
      @paintings = Painting.search params[:search], :page => params[:page], :per_page => 6
    else
      @paintings = Painting.search_all(params[:page])
    end

    @artists = Artist.find(:all, :order => 'last_name')
    @medium = Medium.find(:all, :order => 'name')
  end

  def show
    @painting = Painting.find(params[:id])
    @page_title = @painting.title
    if !@painting.location.nil?
      @map = GMap.new("map_div_id")  
      @map.control_init(:small_map => true, :map_type => true)  
      @map.center_zoom_init([@painting.location.lat,@painting.location.lng],15)
      marker = GMarker.new([@painting.location.lat,@painting.location.lng],   
      :title => "#{@painting.location.name}")  
      @map.overlay_init(marker)
    end
  end

  def latest
    @page_title = "Latest Paintings"
    @paintings = Painting.latest
  end
  
  def rss
    latest
    render :layout => false
  end
end
