class AddRecipientEmailToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :recipient_email, :string
  end
end
