Rails.application.routes.draw do
  resources :reference_duplicates
  resources :author_books
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
