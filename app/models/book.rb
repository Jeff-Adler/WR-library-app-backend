class Book < ApplicationRecord
    has_many :author_books, dependent: :destroy
    has_many :authors, through: :author_books
    has_many :alts, dependent: :destroy

    validates :title, presence: true
    validates :title, uniqueness: true
    validate :check_if_alt

    def check_if_alt
        self.errors.add(:title, 'exists as an alt') if Alt.where(title: self.title).exists?
    end

    def make_alt(reference_book)
        #Removes self from Books and adds it as Alt of reference_book
    end
end
