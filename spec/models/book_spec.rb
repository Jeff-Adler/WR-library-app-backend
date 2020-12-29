require 'rails_helper'
require 'faker'

RSpec.describe Book, type: :model do
  before do
    @book = Book.create(title: Faker::Book.title)
    @alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
  end
  it "is valid with valid attributes" do
    expect(@book).to be_valid
  end
  it "is not valid without a title" do
    expect(Book.new(title: nil)).to_not be_valid
  end 
  it "is not valid if title has a duplicate in Books" do
    puts @book
    expect(Book.new(title: @book.title)).to_not be_valid
  end
  it "is not valid if title has a duplicate in Alts" do
    book = Book.new(title: @alt.title)
    expect(book).to_not be_valid
    expect(book.errors[:check_if_alt]).to be_present
  end
  it "can be added to alts"
  it "will be added, if added to alts"
  it "deletes associated AuthorBook record when deleted"
  it "deletes associated alts when deleted"
end
