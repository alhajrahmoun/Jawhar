class AddGistRefToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :gist, foreign_key: true
  end
end
