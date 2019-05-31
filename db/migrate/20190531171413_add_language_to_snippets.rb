class AddLanguageToSnippets < ActiveRecord::Migration[5.2]
  def change
    add_column :snippets, :language, :string
  end
end
