class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gist
	validates :content, presence: true
end
