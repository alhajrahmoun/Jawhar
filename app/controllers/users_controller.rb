class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@gists = @user.gists

		@gists = @gists.public_gists unless @user == current_user
	end
end