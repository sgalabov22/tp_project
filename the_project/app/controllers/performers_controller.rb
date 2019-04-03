class PerformersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @performers = Performer.all
  end

  def new
    @performer = Performer.new
  end

  def create
    performer = Performer.new(performer_params)

    if performer.save
      redirect_to performers_path
    end
  end

  def destroy
    performer = Performer.find(params[:id])
    performer.songs.each do |song|
      song.destroy
    end

    performer.destroy
    redirect_to performers_path
  end

  def add_song
    performer = Performer.find(params[:performer_id])
    song = Song.find(params[:song_id])

    performer.songs.append(song)
    redirect_to performers_path
  end

  def destroy_song
    song = Song.find(params[:song_id])
    performer = Performer.find(params[:performer_id])

    performer.songs.destroy(song)
    redirect_to performers_path
  end

  def add_album
    album = Album.find(params[:album_id])
    performer = Performer.find(params[:performer_id])

    performer.albums.append(album)
    redirect_to performers_path
  end

  def destroy_album
    album = Album.find(params[:album_id])
    performer = Performer.find(params[:performer_id])

    performer.albums.destroy(album)
    redirect_to performers_path
  end

  private
    def performer_params
      params.require(:performer).permit(:name)
    end
end
