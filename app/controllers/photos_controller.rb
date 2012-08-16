class PhotosController < ApplicationController
  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    #@photos = Photo.where(:user_id => current_user.id)
    @photos = current_user.photos

    #photosets   = flickr.photosets.getList

    #@fsetid  = photosets[5].id
    #@fphotos = flickr.photosets.getPhotos :photoset_id => "72157630312659872"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    #@photo = Photo.find(params[:id])
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    #@photo = Photo.new
    #@photo.user_id = current_user.id
    @photo = current_user.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    #@photo = Photo.new(params[:photo])
    #@photo.user_id = current_user.id
    @photo = current_user.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, :notice => 'Photo was successfully created.' }
        format.json { render :json => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    #@photo = Photo.find(params[:id])
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, :notice => 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    #@photo = Photo.find(params[:id])
    @photo = current_user.photos.find(params[:id])

    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
