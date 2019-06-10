class Search < ApplicationRecord
    belongs_to :searchable, polymorphic: true
    scope :execute, -> (query) {
        where('lower(reverse_index) like :query', query: "%#{query}%")
    }
end
