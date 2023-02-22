class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors, id: :string, limit: 36  do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age

      t.timestamps
    end
  end
end
