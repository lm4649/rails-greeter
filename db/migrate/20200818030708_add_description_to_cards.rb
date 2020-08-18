class AddDescriptionToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :description, :text
  end
end
