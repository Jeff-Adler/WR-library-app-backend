class BookSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :authors, through: :author_books
  has_many :alts
end
