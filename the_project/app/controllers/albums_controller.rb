class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new(album_params)

    if album.save
      redirect_to albums_path
    else
      render album.errors.full_messages
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.songs.each do |song|
      song.destroy
    end

    album.destroy
    redirect_to albums_path
  end

  def add_song
    song = Song.find(params[:song_id])
    album = Album.find(params[:album_id])

    album.songs.append(song)
    redirect_to albums_path
  end

  def destroy_song
    song = Song.find(params[:song_id])
    album = Album.find(params[:album_id])

    album.songs.destroy(song)
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:title)
    end
end
