class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])

    subscription = Subscription.create(song: song, playlist: playlist)
    redirect_to playlist_path(playlist)
  end

  def destroy
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])

    playlist.songs.delete(song)
    redirect_to playlist_path(playlist)
  end
end
