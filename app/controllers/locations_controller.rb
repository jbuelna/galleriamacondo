class LocationsController < ApplicationController
  # GET /admin/locations
  # GET /admin/locations.xml
  def index
    @locations = Location.find(:all)
    @page_title = 'Listing locations'
  end

  # GET /admin/locations/1
  # GET /admin/locations/1.xml
  def show
    @location = Location.find(params[:id])
    @page_title = @location.name
  end

  # GET /admin/locations/new
  # GET /admin/locations/new.xml
  def new
    @location = Location.new
    @page_title = 'Create new location'
  end

  # GET /admin/locations/1/edit
  def edit
    @location = Location.find(params[:id])
    @page_title = 'Edit location #' + @location.id.to_s
  end

  # POST /admin/locations
  # POST /admin/locations.xml
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(admin_locations_path) }
      else
        @page_title = 'Create new location'
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin/locations/1
  # PUT /admin/locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(admin_location_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin/locations/1
  # DELETE /admin/locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to( admin_locations_path) }
    end
  end
end
