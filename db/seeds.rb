require 'faker'

Book.destroy_all
Author.destroy_all
AuthorBook.destroy_all
Alt.destroy_all

20.times do 
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
    book1 = Book.create(title: Faker::Book.title)
    book2 = Book.create(title: Faker::Book.title)
    AuthorBook.create(author_id: author.id, book_id: book1.id)
    AuthorBook.create(author_id: author.id, book_id: book2.id)
end

80.times do 
    Book.all.sample.alts.create(title: Faker::Book.title)
end