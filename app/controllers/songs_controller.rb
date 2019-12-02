class SongsController < ApplicationController
#list all songs
def index
    @songs = Song.all
end 
#views a single song
def show
    @song = Song.find(params[:id])
end 

def new
    @song = Song.new
end 
#fetches a song for editing
def edit 
    @song = Song.find(params[:id])
end 
#creates a new song
#assings and persists new song
#redirects to the created song
def create
    @song = Song.new(valid_params)
    if @song.save
        redirect_to @song
      else
        render :new
      end
end

def update
    @song = Song.find(params[:id])
    if @song.update(valid_params)
          redirect_to @song
        else
          render :edit
        end
end
#destroys the requested song
#redirects to the songs list
def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
end

private 
def valid_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
end 
end
