class AddEmailToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :contributor_mail, :string
  end
end
