class Alt < ApplicationRecord
  belongs_to :book

  validates :title, presence: true
  validates :title, uniqueness: true

  validate :check_if_book

    def check_if_book
        self.errors.add(:title, 'exists as a book') if Book.where(title: self.title).exists?
    end
end
