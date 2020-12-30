require 'rails_helper'

RSpec.describe Alt, type: :model do
  before do
    @book = Book.create(title: Faker::Book.title)
    @alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
  end
  it "is valid with valid attributes" do
    expect(@alt).to be_valid
  end
  it "is invalid without title" do 
    expect(Alt.create(title: nil, book_id: @book.id))
  end
  it "is valid to associate multiple alts to the same book"
  it "is invalid to associate a single alt to multiple books"
  it "is invalid without associated book"
  it "is invalid if title has a duplicate"
  it "is not valid if title has a duplicate in books"
  it "is valid if book with duplicate title is first deleted, and then added to Alts"
  it "does not delete associated book, if deleted"
end
