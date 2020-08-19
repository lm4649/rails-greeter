class ChangeUserToContributions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :contributions, :user
    add_reference :contributions, :user, foreign_key: true, null: true
  end
end
