class Song < ApplicationRecord
  has_many :subscriptions
  has_many :playlists, through: :subscriptions
end
