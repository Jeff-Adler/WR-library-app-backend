class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates :author, uniqueness: {scope: :book, :message => "database already contains association between that author and book"}
end
