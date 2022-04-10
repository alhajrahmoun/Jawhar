module ApplicationHelper
  def owner(model)
    model.user.full_name
  end
end
