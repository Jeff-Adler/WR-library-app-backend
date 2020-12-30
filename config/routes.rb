Rails.application.routes.draw do
  patch 'books/:id/convert_to_alt/:reference_book_id', to: 'books#convert_to_alt'
  patch 'alts/:id/convert_to_book', to: 'alts#convert_to_book'

  resources :alts
  resources :reference_duplicates
  resources :author_books
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
