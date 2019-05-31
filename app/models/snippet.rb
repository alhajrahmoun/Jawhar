class Snippet < ApplicationRecord
	belongs_to :gist, counter_cache: true
	validates :name, presence: { message: "الرجاء إضافة اسم للملف" }
	validates :code, presence: { message: "الرجاء إضافة محتوى للملف" }

	after_save :format_snippet, if: :saved_change_to_code?

  LEXER = {
			'c': 'C',
			'csharp': 'C#',
			'cpp': 'C++',
			'coffee-script': 'CoffeeScript',
			'css': 'CSS',
			'go': 'Go',
			'html': 'HTML',
			'jade': 'Jade',
			'java': 'Java',
			'js': 'JavaScript',
			'json': 'JSON',
			'kotlin': 'Kotlin',
			'objective-c': 'Objective-C',
			'php': 'PHP',
			'python': 'Python',
			'python3': 'Python 3',
			'rb': 'Ruby',
			'sql': 'SQL',
			'ts': 'TypeScript'
	}

	def format_snippet
		HighlightCodeJob.perform_later(self.id)
	end
end