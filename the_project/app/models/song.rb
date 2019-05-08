class Song < ApplicationRecord
  has_many :subscriptions
  has_many :playlists, through: :subscriptions

  belongs_to :album, optional: true
  belongs_to :performer, optional: true

  has_attached_file :mp3_song
  validates_attachment_content_type :mp3_song, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  validates :mp3_song, presence: true
end
