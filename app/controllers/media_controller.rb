class MediaController < ApplicationController
  # GET /media
  # GET /media.xml
  def index
    @page_title = 'Listing Medium'
    @media = Medium.find(:all, :order => "name")
  end

  # GET /media/1
  # GET /media/1.xml
  def show
    @medium = Medium.find(params[:id])
    @page_title = @medium.name
  end

  # GET /media/new
  # GET /media/new.xml
  def new
    @page_title = 'Add Media'
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
    @page_title = 'Edit Media'
    @medium = Medium.find(params[:id])
  end

  # POST /media
  # POST /media.xml
  def create
    @medium = Medium.create!(params[:medium])
 
    flash[:notice] = 'Media was successfully created.'
    respond_to do |format|
      format.html { redirect_to admin_media_path(@medium) }
      format.js
    end
  end

  # PUT /media/1
  # PUT /media/1.xml
  def update
    @medium = Medium.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        flash[:notice] = 'Media was successfully updated.'
        format.html { redirect_to(admin_media_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.xml
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to(admin_media_url) }
    end
  end
end
