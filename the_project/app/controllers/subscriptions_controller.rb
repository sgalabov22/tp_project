class SubscriptionsController < ApplicationController
  def create
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])

    subscription = Subscription.create(song: song, playlist: playlist)
    redirect_to playlists_path
  end

  def destroy
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])

    playlist.songs.delete(song)
    redirect_to playlists_path
  end
end
