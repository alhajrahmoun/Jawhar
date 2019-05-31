class AddHighlightedCodeToSnippets < ActiveRecord::Migration[5.2]
  def change
    add_column :snippets, :highlighted_code, :text
  end
end
