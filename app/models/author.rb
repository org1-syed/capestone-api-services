class Author < ApplicationRecord
    has_many :books
    accepts_nested_attributes_for :books

    validates :id, uniqueness: true
    validates :first_name, :last_name, uniqueness: { message: "Duplicate entry is provided" }, presence: { message: 'Required fields are missing or cannot be blank' }
    validates :age, numericality: { only_integer: true }

end
