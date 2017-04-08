class Snippet < ApplicationRecord
	has_paper_trail
	belongs_to :gist, counter_cache: true
end
