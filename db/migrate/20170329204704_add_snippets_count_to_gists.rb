class AddSnippetsCountToGists < ActiveRecord::Migration[5.0]
  def change
    add_column :gists, :snippets_count, :integer, default: 0
  end
end
