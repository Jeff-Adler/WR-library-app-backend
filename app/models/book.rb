class Book < ApplicationRecord
    has_many :author_books
    has_many :authors, through: :author_books
    has_many :reference_duplicates
    has_many :duplicates, through: reference_duplicates
end
