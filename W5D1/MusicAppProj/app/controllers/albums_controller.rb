class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to albums_url
    else
      flash[:errors] = @album.errors.full_messages
    end

  end

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end
end
