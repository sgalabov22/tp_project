class AddPerformerIdToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :performer_id, :integer
  end
end
