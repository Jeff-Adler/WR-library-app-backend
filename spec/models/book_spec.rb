require 'rails_helper'
require 'faker'

RSpec.describe Book, type: :model do
  before do
    @book = Book.create(title: Faker::Book.title)
    @alt = Alt.create(title: Faker::Book.title, book: @book)
  end
  it "is valid with valid attributes" do
    expect(@book).to be_valid
  end
  it "is not valid without a title" do
    expect(Book.create()).to_not be_valid
  end 
  it "is not valid if title has a duplicate in Books" do
    expect(Book.create(title: @book.title)).to_not be_valid
  end
  it "is not valid if title has a duplicate in Alts" do
    expect(Book.create(title: @alt.title)).to_not be_valid
  end
end
