module ApplicationHelper

	def owner(model)
		[model.user.first_name, model.user.last_name].join(' ')
	end
end
