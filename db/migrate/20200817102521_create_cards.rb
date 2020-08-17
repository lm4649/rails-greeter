class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :recipient
      t.date :event_date
      t.references :user, null: false, foreign_key: true
      t.boolean :draft

      t.timestamps
    end
  end
end
