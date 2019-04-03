class Song < ApplicationRecord
  has_many :subscriptions
  has_many :playlists, through: :subscriptions

  belongs_to :album
  belongs_to :performer
end
