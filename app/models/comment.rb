class Comment < ApplicationRecord
	has_rich_text :content

	belongs_to :user
	belongs_to :gist, counter_cache: true

	validates :content, presence: true

	after_create_commit :notify_gist_owner

	def notify_gist_owner
		gist.user.notifications.create!(notifiable_type: 'Gist', notifiable_id: gist_id,
																		notifier_id: user_id)
	end
end
