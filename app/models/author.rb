class Author < ApplicationRecord
    has_many :author_books, dependent: :destroy
    has_many :books, through: :author_books

    validates :first_name, :last_name, presence: true

    # checks for uniqueness of author
    # validates :last_name, uniqueness: {scope: :first_name, :message => "author with that name already exists"}
    # validates :first_name, uniqueness: {scope: :last_name, :message => "author with that name already exists"}
end
