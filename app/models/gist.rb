class Gist < ApplicationRecord
	SNIPPETS_COUNT_MIN = 1

	include PgSearch
	pg_search_scope :search_by_title, :against => :title
	acts_as_taggable_on :tags

	has_many :snippets, inverse_of: :gist, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, as: :notifiable
	belongs_to :user

	accepts_nested_attributes_for :snippets, allow_destroy: true, reject_if: :all_blank

	scope :private_gists, -> { where(private: true) }
	scope :public_gists, -> { where(private: false) }

	before_validation :generate_slug, on: :create

	validates :title, presence: { message: "الرجاء إضافة عنوان للجوهر" }
	validates :slug, presence: true

	validate do
		errors.add(:base, :snippets_too_short, count: SNIPPETS_COUNT_MIN) unless snippets_count_valid?
	end

	def short_url
		Rails.application.routes.url_helpers.short_url(slug: self.slug)
	end

	private
	def generate_slug
		loop do
			self.slug = SecureRandom.uuid[0..4]
			break unless self.class.where(slug: self.slug).any?
		end
	end

	def snippets_count_valid?
		snippets.reject(&:marked_for_destruction?).count >= SNIPPETS_COUNT_MIN
	end
end
