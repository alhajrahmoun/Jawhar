class AddPrivsteToGists < ActiveRecord::Migration[7.0]
  def change
    add_column :gists, :private, :boolean, default: false
  end
end
