class Book < ApplicationRecord

  belongs_to :author

  validates :id, uniqueness: true
  validates :title, uniqueness: {scope: :author_id, message: "Duplicate entry is provided" }
  validates :title, length: { maximum: 255 }, presence: { message: 'Required fields are missing or cannot be blank' }
end
