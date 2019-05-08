class Song < ApplicationRecord
  has_many :subscriptions
  has_many :playlists, through: :subscriptions

  belongs_to :album, optional: true
  belongs_to :performer, optional: true

  has_attached_file :mp3
  validates_attachment_content_type :mp3, :content_type => [ 'mp3/mpeg', 'mp3/x-mpeg', 'mp3/mp3', 'mp3/x-mp3', 'mp3/mpeg3', 'mp3/x-mpeg3', 'mp3/mpg', 'mp3/x-mpg', 'mp3/x-mpegmp3' ]
end
