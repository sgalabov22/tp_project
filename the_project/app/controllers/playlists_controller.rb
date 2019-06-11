class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
    @songs = Song.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = @playlist.songs

    @songs_sources = {}
    i = 0
    @playlist_songs.each do |song|
      @songs_sources[i] = song.mp3_song.to_s
      i += 1
    end

    @songs_json = @songs_sources.to_json
    @songsCount = i
  end

  def create
    playlist = Playlist.new(playlist_params)
    current_user.playlists.append(playlist)

    if playlist.save
      redirect_to playlists_path
    else
      redirect_to root_path
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    playlist = Playlist.find(params[:id])
    
    if playlist.update_attributes(playlist_params)
      redirect_to playlist_path(playlist)
    else 
      redirect_to edit_playlist_path(playlist)
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
