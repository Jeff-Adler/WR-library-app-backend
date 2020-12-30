require 'faker'

Book.destroy_all
Author.destroy_all
AuthorBook.destroy_all
Alt.destroy_all

10.times do 
    author = Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
    book = Book.create(title: Faker::Book.title)
    AuthorBook.create(author_id: author.id, book_id: book.id)
end

Book.all.each do |book|
    3.times do
        book.alts.create(title: Faker::Book.title)
    end
end

#Valid
# ReferenceDuplicate.create(reference: Book.all[0], duplicate: Book.all[1])
# ReferenceDuplicate.create(reference: Book.all[0], duplicate: Book.all[2])
# ReferenceDuplicate.create(reference: Book.all[0], duplicate: Book.all[3])
# ReferenceDuplicate.create(reference: Book.all[5], duplicate: Book.all[6])
# ReferenceDuplicate.create(reference: Book.all[5], duplicate: Book.all[7])
# ReferenceDuplicate.create(reference: Book.all[5], duplicate: Book.all[8])

# #Invalid: There cannot be duplicates of duplicates
# ReferenceDuplicate.create(reference: Book.all[0], duplicate: Book.all[3])
# ReferenceDuplicate.create(reference: Book.all[5], duplicate: Book.all[3])

# #Invalid: There cannot be duplicates that are also references
# ReferenceDuplicate.create(reference: Book.all[8], duplicate: Book.all[10])
# ReferenceDuplicate.create(reference: Book.all[1], duplicate: Book.all[12])

