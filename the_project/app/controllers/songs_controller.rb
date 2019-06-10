class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :destroy, :update, :edit]
  # GET /songs
  # GET /songs.json

  def is_admin?
    redirect_to songs_path, warning: "You are not authorized" unless current_user.admin?
  end

  def index
    @songs = Song.all
=begin
    if params[:search]
      @songs = Search.execute(params[:search]);
    else
      @songs = Song.all.order("created_at DESC");
    end
=end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    song = Song.new(song_params)
    performer = Performer.find(params[:performer_id])
    performer.songs.append(song)

    if song.save
      redirect_to songs_path
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addToLiked
    songToAdd = Song.find(params[:id])
    if !current_user.songs.include? songToAdd
      current_user.songs.append(songToAdd)
      redirect_to songs_path
    else
      redirect_to songs_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :mp3_song, :performer_id)
    end
end
