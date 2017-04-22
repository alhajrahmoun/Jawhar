class Admin::DashboardController <  Admin::BaseController
	def index
		@visit_count = Visit.count
		@user_count = User.count
		@active_users = User.active_users
		@gist_count = Gist.count
		@snippet_count = Snippet.count
	end
end