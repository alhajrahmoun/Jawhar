class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :commenter, class_name: 'User'
  belongs_to :gist

  def self.get_unread_count(user_id)
  	User.find(user_id).notifications.where(read: false).count
  end
end
