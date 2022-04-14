class AddGistRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :gist, foreign_key: true
  end
end
