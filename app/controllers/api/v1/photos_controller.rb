class Api::V1::PhotosController < ApiController
  def index
    @photos = Photo.all
    render json: {
      data: @photos.map do |photo|
        {
          title: photo.title,
          date: photo.date,
          description: photo.description
        }
      end
    }
  end

  def show
    # @photo = Photo.find(params[:id]) # will rise RecordNotFound when there's no such data
    @photo = Photo.find_by(id: params[:id]) # use find_by is better
    if !@photo
      render json: {
        message: "Can't find the photo!",
        status: 400  # Bad Request
      }
    else
      render json: {
        title: @photo.title,
        date: @photo.date,
        description: @photo.description
      }
    end
    
  end
end
