class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
