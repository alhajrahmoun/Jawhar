class Snippet < ApplicationRecord
	belongs_to :gist, counter_cache: true
end
