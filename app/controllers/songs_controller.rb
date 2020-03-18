class SongsController < ApplicationController
    def new
        @song = Song.new
        @artist = @song.artist
        @genre = @song.genre
    end

    def index
        @songs = Song.all 
        # byebug
    end

    def show
        @song = Song.find(params[:id])
        @artist = @song.artist
        @genre = @song.genre
        # byebug
    end

    def edit
        @song = Song.find(params[:id])
        @artist = @song.artist
        @genre = @song.genre
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to @song
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to @song
    end

    private

	def song_params
		params.require(:song).permit(:name, :artist_id, :genre_id)
    end
    
end
