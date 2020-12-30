class Alt < ApplicationRecord
  belongs_to :book

  validates :title, presence: true
  validates :title, uniqueness: true

  validate :check_if_book

  def check_if_book
      self.errors.add(:title, 'exists as a book') if Book.where(title: self.title).exists?
  end

  #Remove self from Alts and adds it to Books
  def convert_to_book
    book = Book.new(title:self.title)
    self.destroy
    book.save
  end
end
