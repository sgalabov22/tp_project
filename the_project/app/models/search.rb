class Search < ApplicationRecord
    belongs_to :searchable, polymorphic: true
    scope :execute, -> (query) {
        where('reverse_index like :query', query: "%#{query}%")
    }
end
