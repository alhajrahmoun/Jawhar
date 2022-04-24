class AddSlugToGists < ActiveRecord::Migration[7.0]
  def change
    add_column :gists, :slug, :string
  end
end
