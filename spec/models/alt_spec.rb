require 'rails_helper'

RSpec.describe Alt, type: :model do
  it "is valid with valid attributes"
  it "is invalid if title has a duplicate"
  it "is not valid if title has a duplicate in books"
  it "is valid if book with duplicate title is first deleted, and then added to Alts"
  it "does not delete associated book, if deleted"
end
