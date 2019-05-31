class HighlightCodeJob < ApplicationJob
  queue_as :default

  def perform(snippets_id)
    snippet = Snippet.find_by(id: snippets_id)
    uri = URI.parse('http://hilite.me/api')
    response = Net::HTTP.post_form(uri, code: snippet.code, lexer: snippet.language, divstyles: 'padding:.2em .6em;')
    highlighted_code = response.body.gsub('line-height: 125%', 'line-height: 165%; height:500px')
    snippet.update_attribute(:highlighted_code, highlighted_code)
  end
end
