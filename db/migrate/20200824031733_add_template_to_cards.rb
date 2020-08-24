class AddTemplateToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :template, :string
  end
end
