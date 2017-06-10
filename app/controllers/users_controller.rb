class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@gists = @user.gists
	end
end