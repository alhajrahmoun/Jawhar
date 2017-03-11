class AddUserRefToGists < ActiveRecord::Migration[5.0]
  def change
    add_reference :gists, :user, foreign_key: true
  end
end
