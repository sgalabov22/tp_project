class Album < ApplicationRecord
  belongs_to :performer, optional: true

  has_many :songs
end
