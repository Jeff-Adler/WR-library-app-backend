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
    expect(book.errors[:title]).to be_present
  end
  it "can be deleted" do
    book = Book.create(title: Faker::Book.title)
    expect{book.destroy()}.to change(Book.all, :count).by(-1)
  end
  it "deletes associated AuthorBook record when deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title) 
    AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{book.destroy()}.to change(AuthorBook.all, :count).by(-1)
  end
  it "does not delete associated Book record when deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title) 
    AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{book.destroy()}.to change(Author.all, :count).by(0)
  end
  it "can change associations between alts, to book, without creating multiple books associated to the same alt" do
    book2 = Book.create(title: Faker::Book.title)
    alt1 = Alt.create(title: Faker::Book.title, book_id: book2.id)
    alt2 = Alt.create(title: Faker::Book.title, book_id: book2.id)
    alt3 = Alt.create(title: Faker::Book.title, book_id: book2.id)
    expect{@book.alts << alt1}.to change(@book.alts, :count).by(1)
    expect{@book.alts << alt2}.to change(@book.alts, :count).by(1)
    expect{@book.alts << alt3}.to change(@book.alts, :count).by(1)
    expect{book2.alts << alt1}.to change(@book.alts, :count).by(-1)
    expect{book2.alts << alt2}.to change(@book.alts, :count).by(-1)
    expect{book2.alts << alt3}.to change(@book.alts, :count).by(-1)
  end
  it "can remove association between alt and book" do
    alt = Alt.create(title: Faker::Book.title, book_id: @book.id)
    expect{alt.destroy()}.to change(@book.alts, :count).by(-1)
  end
  it "can be added to alts"
  it "will be added, if added to alts"
end
