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
  it "is invalid without book association" do 
    expect(Alt.create(title: Faker::Book.title, book_id: nil))
  end
  it "is valid to associate multiple alts to the same book" do
    Alt.create(title: Faker::Book.title, book_id: @book.id)
    expect(Alt.create(title: Faker::Book.title, book_id: @book.id)).to be_valid
  end
  it "is invalid if title has a duplicate in alts" do
    alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
    expect(Alt.create(title: alt.title, book_id: @book.id)).to_not be_valid
  end
  it "is invalid if title has a duplicate in books" do
    book = Book.create(title: Faker::Book.title)
    expect(Alt.create(title: book.title, book_id: @book.id)).to_not be_valid
  end
  it "does delete" do
    alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
    expect{alt.destroy()}.to change(Alt.all, :count).by(-1)
  end
  it "does not delete associated book, if deleted" do
    alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
    expect{alt.destroy()}.to change(Book.all, :count).by(0)
  end
  it "is valid if book with duplicate title is first deleted, and then added to Alts"
end
