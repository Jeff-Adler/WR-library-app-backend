class BookSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :authors, through: :author_books
  has_many :alts

  def authors
    object.authors.order("last_name")
  end

  def alts
    object.alts.order("title")
  end
end
