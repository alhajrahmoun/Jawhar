class AddGistRefToSnippets < ActiveRecord::Migration[7.0]
  def change
    add_reference :snippets, :gist, foreign_key: true
  end
end
