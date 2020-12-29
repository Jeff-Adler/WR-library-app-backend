require 'rails_helper'
require 'faker'

RSpec.describe Author, type: :model do
  before do
    @author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end
  it "is valid with valid attributes" do
    expect(@author).to be_valid
  end
  it "is not valid without a first name" do
    expect(Author.create(last_name: Faker::Name.last_name)).to_not be_valid
  end
  it "is not valid without a last name" do
    expect(Author.create(first_name: Faker::Name.first_name)).to_not be_valid
  end
  it "is valid if first name has a duplicate but not last name" do
    expect(Author.create(first_name: @author.first_name, last_name: Faker::Name.last_name)).to be_valid
  end
  it "is valid if last name has a duplicate but not first name" do
    expect(Author.create(first_name: Faker::Name.first_name, last_name: @author.last_name)).to be_valid
  end
  it "is valid if first name and last name have duplicates" do
    expect(Author.create(first_name: @author.first_name, last_name: @author.last_name)).to be_valid
  end
end
