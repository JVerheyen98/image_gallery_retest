class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  #added to authenticate user and gallery id
  before_action :authenticate_user!
  before_action :set_gallery
  before_action :authorize_user!

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  # edited to fit my variable names.
  def create
    @photo = @gallery.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @gallery, notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy!

    respond_to do |format|
      format.html { redirect_to photos_path, status: :see_other, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # edited to allow images
    def photo_params
      params.require(:photo).permit(:caption, :image, :gallery_id)
    end
    
    #added to define these methods for the top before actions added. 
    def set_gallery
      @gallery = Gallery.find(params[:gallery_id])
    end

    def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless @gallery.user == current_user
    end

    def set_photo
      @photo = @gallery.photos.find(params[:id])
    end

end
