class ReferenceDuplicate < ApplicationRecord
  belongs_to :reference, class_name: 'Book'
  belongs_to :duplicate, class_name: 'Book'
end
