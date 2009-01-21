class PaintingsController < ApplicationController
  # GET /paintings
  # GET /paintings.xml
  def index
    @page_title = 'Listing Paintings'
    @paintings = Painting.find(:all)
  end

  # GET /paintings/1
  # GET /paintings/1.xml
  def show
    @painting = Painting.find(params[:id])
    @page_title = @painting.title
  end

  # GET /paintings/new
  # GET /paintings/new.xml
  def new
    load_data
    @page_title = 'Add Painting'
    @painting = Painting.new
  end

  # GET /paintings/1/edit
  def edit
    load_data
    @page_title = 'Edit Painting'
    @painting = Painting.find(params[:id])
  end

  # POST /paintings
  # POST /paintings.xml
  def create
    @painting = Painting.new(params[:painting])
    respond_to do |format|
      if @painting.save
        flash[:notice] = 'Painting was successfully created.'
        format.html { redirect_to(admin_paintings_path) }
      else
        load_data
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /paintings/1
  # PUT /paintings/1.xml
  def update
    @painting = Painting.find(params[:id])

    respond_to do |format|
      if @painting.update_attributes(params[:painting])
        flash[:notice] = 'Painting was successfully updated.'
        format.html { redirect_to(admin_paintings_path(@painting)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /paintings/1
  # DELETE /paintings/1.xml
  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.html { redirect_to(admin_paintings_path) }
    end
  end
  
  private 
  
  def load_data
    @artists = Artist.find(:all, :order => 'last_name')
    @media = Medium.find(:all, :order => 'name')
    @location = Location.find(:all, :order => 'name')
  end
end
