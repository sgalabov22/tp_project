class AddPerformerIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :performer_id, :integer
  end
end
