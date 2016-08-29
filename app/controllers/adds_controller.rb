class AddsController < ApplicationController
	def create
		user = User.find(session[:user_id])
		song = Song.find(params[:song_id])
		puts user.id
		puts song.id
		added = Add.where(user_id: user.id, song_id: song.id).first
		song.increment!(:count)
		if added
			added.increment!(:count)
		else
			Add.create(user_id: user.id, song_id: song.id, count: 1)
		end
		redirect_to songs_path

	end
end
