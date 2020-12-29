class Alt < ApplicationRecord
  belongs_to :book

  validates :title, presence: true
  validates :title, uniqueness: true
end
