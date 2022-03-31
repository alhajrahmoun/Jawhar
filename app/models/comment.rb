class Comment < ApplicationRecord
	has_rich_text :content
	belongs_to :user
	belongs_to :gist, counter_cache: true
	validates :content, presence: true
end
