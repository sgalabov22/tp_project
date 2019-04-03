class Album < ApplicationRecord
  belongs_to :performer

  has_many :songs
end
