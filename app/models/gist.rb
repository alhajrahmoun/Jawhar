class Gist < ApplicationRecord
	SNIPPETS_COUNT_MIN = 1

	has_many :snippets, inverse_of: :gist, dependent: :destroy
	accepts_nested_attributes_for :snippets, allow_destroy: true, reject_if: :all_blank
	has_many :comments, dependent: :destroy
	belongs_to :user

	validates :title, presence: true
	validate do
    	check_snippets_number
  	end


	acts_as_taggable_on :tags


	private 
	def snippets_count_valid?
		snippets.reject(&:marked_for_destruction?).count >= SNIPPETS_COUNT_MIN
	end

	def check_snippets_number
		unless snippets_count_valid?
			errors.add(:base, :snippets_too_short, count: SNIPPETS_COUNT_MIN)
		end
	end
end
