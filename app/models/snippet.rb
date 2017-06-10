class Snippet < ApplicationRecord
	belongs_to :gist, counter_cache: true
	validates :name, presence: { message: "الرجاء إضافة اسم للملف" }
	validates :code, presence: { message: "الرجاء إضافة محتوى للملف" }
end
