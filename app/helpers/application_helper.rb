module ApplicationHelper

	def owner(model)
		[model.user.first_name, model.user.last_name].join(' ')
	end

	def full_name(user)
		[user.first_name, user.last_name].join(' ')
	end
end
