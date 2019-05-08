class AddAttachmentMp3SongToSongs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :songs do |t|
      t.attachment :mp3_song
    end
  end

  def self.down
    remove_attachment :songs, :mp3_song
  end
end
