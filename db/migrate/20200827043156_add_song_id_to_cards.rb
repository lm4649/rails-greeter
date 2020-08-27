class AddSongIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :song_id, :string
  end
end
