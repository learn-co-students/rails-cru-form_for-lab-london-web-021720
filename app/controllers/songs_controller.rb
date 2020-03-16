class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find_by(id: params[:id])
        @artist = Artist.find_by(id: @song.artist_id)
        @genre = Genre.find_by(id: @song.genre_id)
    end

    def new
        @song = Song.new
    end

    def create
        song = Song.create(params.require(:song).permit(:name, :genre_id, :artist_id))
        redirect_to song
    end

    def edit
        @song = Song.find_by(id: params[:id])
    end

    def update
        song = Song.find_by(id: params[:id])
        song.update(params.require(:song).permit(:name, :genre_id, :artist_id))
        redirect_to song
    end
end
