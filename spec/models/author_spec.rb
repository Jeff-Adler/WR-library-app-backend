require 'rails_helper'
require 'faker'

RSpec.describe Author, type: :model do
  before do
    @author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    @book = Book.create(title: Faker::Book.title) 
  end
  it "is valid with valid attributes" do
    expect(@author).to be_valid
  end
  it "is not valid without a first name" do
    expect(Author.new(first_name: nil, last_name: Faker::Name.last_name)).to_not be_valid
  end
  it "is not valid without a last name" do
    expect(Author.new(first_name: Faker::Name.first_name, last_name: nil)).to_not be_valid
  end
  it "is valid if first name has a duplicate but not last name" do
    expect(Author.new(first_name: @author.first_name, last_name: Faker::Name.last_name)).to be_valid
  end
  it "is valid if last name has a duplicate but not first name" do
    expect(Author.new(first_name: Faker::Name.first_name, last_name: @author.last_name)).to be_valid
  end
  it "is valid if first name and last name have duplicates" do
    expect(Author.new(first_name: @author.first_name, last_name: @author.last_name)).to be_valid
  end
  it "can be deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    expect{author.destroy()}.to change(Author.all, :count).by(-1)
  end
  it "deletes associated AuthorBook record when deleted" do
    author = Author.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create!(title: Faker::Book.title) 
    AuthorBook.create!(author_id: author.id, book_id: book.id)
    expect{author.destroy()}.to change(AuthorBook.all, :count).by(-1)
  end
  it "does not delete associated Book record when deleted" do
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    book = Book.create(title: Faker::Book.title) 
    AuthorBook.create(author_id: author.id, book_id: book.id)
    expect{author.destroy()}.to change(Book.all, :count).by(0)
  end
end
