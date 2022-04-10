class AddSnippetsCountToGists < ActiveRecord::Migration[7.0]
  def change
    add_column :gists, :snippets_count, :integer, default: 0
  end
end
