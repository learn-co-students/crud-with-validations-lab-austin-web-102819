class SongsController < ActionController::Base

    def index
        @songs = Song.all 
    end

    def new
        @song = Song.new
    end

    def show 
        @song = Song.find(params[:id])
    end

    def edit 
        @song = Song.find(params[:id])
    end

    def create 
        @song = Song.new(s_params)
        if @song.save 
            redirect_to @song
        else
            render :new
        end
    end
    
    def update
        @song = Song.find(params[:id])
        if @song.update(s_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_url
    end    
    
    private 

    def s_params
        params.require(:song).permit! 
    end
end