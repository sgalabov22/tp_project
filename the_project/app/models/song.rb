class Song < ApplicationRecord
  has_many :subscriptions
  has_many :playlists, through: :subscriptions

  belongs_to :album, optional: true
  belongs_to :performer, optional: true

  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end
end
