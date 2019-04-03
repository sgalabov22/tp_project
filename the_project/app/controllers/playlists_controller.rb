class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
    @songs = Song.all

  end

  def new
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new(playlist_params)

    if playlist.save
      redirect_to playlists_path
    else
      redirect_to root_path
    end
  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.destroy

    redirect_to playlists_path
  end

private
  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
