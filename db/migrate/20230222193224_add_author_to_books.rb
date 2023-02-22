class AddAuthorToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :author, type: :string
  end
end
