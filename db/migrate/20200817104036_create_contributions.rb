class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.string :contributor_name
      t.text :content
      t.references :card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :rejected, default: false

      t.timestamps
    end
  end
end
