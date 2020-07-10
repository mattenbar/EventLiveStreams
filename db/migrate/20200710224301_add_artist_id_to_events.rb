class AddArtistIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :artist_id, :integer
  end
end
