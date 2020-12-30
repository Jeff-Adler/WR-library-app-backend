require 'rails_helper'

RSpec.describe AuthorBook, type: :model do
  before do
    @author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    @book = Book.create(title: Faker::Book.title)
    @author2 = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    @book2 = Book.create(title: Faker::Book.title)
    @author_book = AuthorBook.create(author_id: @author.id, book_id: @book.id)
    @author_book2 = AuthorBook.create(author_id: @author2.id, book_id: @book2.id)
  end
  it "is valid with valid attributes" do
    expect(@author_book).to be_valid
  end
  it "is not valid if book_id is missing" do
    expect(AuthorBook.new(author_id: @author_id, book_id: nil)).to_not be_valid
  end
  it "is not valid if author_id is missing" do
    expect(AuthorBook.new(author_id: nil, book_id: @book_id)).to_not be_valid
  end
  it "is is valid if book_id has duplicate but not author_id" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    expect(AuthorBook.new(author_id: author.id, book_id: @author_book.book.id)).to be_valid
  end
  it "is is valid if author_id has duplicate but not book_id" do
    book = Book.create(title: Faker::Book.title)
    expect(AuthorBook.new(author_id: @author_book.author.id, book_id: book.id)).to be_valid
  end
  it "is valid if author_id and book_id are duplicates, but in different rows" do
    expect(AuthorBook.new(author_id: @author_book.author.id, book_id: @author_book2.book.id)).to be_valid
  end
  it "is not valid if another row exists with the same author_id and book_id" do
    expect(AuthorBook.new(author_id: @author_book.author.id, book_id: @author_book.book.id)).to_not be_valid
  end
  it "can be deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title)
    author_book = AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{author_book.destroy()}.to change(AuthorBook.all, :count).by(-1)
  end
  it "can be deleted without associated author being deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title)
    author_book = AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{author_book.destroy()}.to change(Author.all, :count).by(0)
  end
  it "can be deleted without associated book being deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title)
    author_book = AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{author_book.destroy()}.to change(Book.all, :count).by(0)
  end
end
