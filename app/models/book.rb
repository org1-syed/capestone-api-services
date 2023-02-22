class Book < ApplicationRecord

  validates :id, uniqueness: true
  validates :title, uniqueness: {scope: :author, message: "Duplicate Book is provided" }
  validates :title, :author, length: { maximum: 255 }, presence: { message: 'Required fields are missing or cannot be blank' }
end
