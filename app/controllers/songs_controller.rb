class SongsController < ApplicationController
  def index
    if params[:artist_id] #if there is artist id param then do something 
      @artist = Artist.find_by(id: params[:artist_id]) #have artist equal the param artist id 
      if @artist.nil? #if artist is nil then do something 
        redirect_to artists_path, alert: "Artist not found" #show an error and bring back to artist path 
      else
        @songs = @artist.songs #else set an artist song to songs 
      end
    else
      @songs = Song.all #else show all songs 
    end
  end

  def show
    if params[:artist_id] #if there is an artist id 
      @artist = Artist.find_by(id: params[:artist_id]) #set a var to to an artist id 
      @song = @artist.songs.find_by(id: params[:id]) # set song to an artist song id 
      if @song.nil? #is there a song 
        redirect_to artist_songs_path(@artist), alert: "Song not found" #show an error and redir the user to an artist 
      end
    else
      @song = Song.find(params[:id]) #set the song to the params id 
    end
  end
  

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

