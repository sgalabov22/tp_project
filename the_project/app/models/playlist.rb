class Playlist < ApplicationRecord
  has_many :subscriptions
  has_many :songs, through: :subscriptions
end
