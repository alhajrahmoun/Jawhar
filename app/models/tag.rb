class Tag < ApplicationRecord
	include PgSearch
	multisearchable :against => :name
end