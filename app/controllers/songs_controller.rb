class SongsController < ApplicationController
	def index
		@songs = Song.all
		@user = current_user
		@add = Add.all
		
	end

	def show
		@song = Song.find(params[:id])
		@add = Add.where(song_id:params[:id])

	end


	def create
		@song = Song.new(song_params)
		if @song.save
			redirect_to songs_path(current_user.id)
      	else
      		flash[:errors] = @song.errors.full_messages
      		redirect_to songs_path(current_user.id)
      	end
	end

	private
	def song_params
		params.require(:song).permit(:title, :artist, :count)
	end
end
