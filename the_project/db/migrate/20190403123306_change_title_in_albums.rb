class ChangeTitleInAlbums < ActiveRecord::Migration[5.2]
  def change
    rename_column :albums, :name, :title
  end
end
