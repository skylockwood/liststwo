class UsersController < ApplicationController
	def main
		
	end

	def show
		@user = User.find(params[:id])
		@adds = Add.where(user_id:params[:id]) 
	end

	def edit
		@user = current_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
      		redirect_to songs_path
      	else
      		flash[:errors] = @user.errors.full_messages
      		redirect_to "/"
      	end
	end

	def update
		@user = User.find(params[:id])
		User.where(id: params[:id]).limit(1).update_all(user_params)
		redirect_to user_path(@user.id)
	end

	def destroy
		User.destroy(params[:id])
		session.clear
		redirect_to new_session_path
	end

	private
	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :password)
	end
end
