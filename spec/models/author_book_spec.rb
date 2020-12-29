require 'rails_helper'

RSpec.describe AuthorBook, type: :model do
  before do
    @author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    @book = Book.create(title: Faker::Book.title)
    @author_book = AuthorBook.create(author_id: @author.id, book_id: @book.id)
  end
  it "is valid with valid attributes"
  it "is not valid if book_id is missing"
  it "is not valid if author_id is missing"
  it "can be deleted"
end
