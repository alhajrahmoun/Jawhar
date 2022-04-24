class Bookmark < ApplicationRecord
  belongs_to :gist
  belongs_to :user
end
