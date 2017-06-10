class NotificationsController < ApplicationController
	def index
		@notifications = current_user.notifications.order('created_at DESC')
	end

	def link
		@notification = current_user.notifications.find(params[:id])
		@notification.update(read: true)
		redirect_to gist_path(@notification.gist_id)
	end
end