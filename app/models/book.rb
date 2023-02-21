class Book < ApplicationRecord

  validates :id, uniqueness: true
  validates :title, uniqueness: {scope: :author, message: "Duplicate Book name is provided" }
  validates :title, :author, length: { maximum: 255 }
  validates :title, :author, presence: { message: 'Required fields are missing or cannot be blank' }
end
