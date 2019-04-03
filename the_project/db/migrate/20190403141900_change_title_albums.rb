class ChangeTitleAlbums < ActiveRecord::Migration[5.2]
  def change
    rename_column :albums, :title, :name
  end
end
