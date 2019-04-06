class Album < ApplicationRecord
  belongs_to :performer, optional: true

  has_many :songs

  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end
end
