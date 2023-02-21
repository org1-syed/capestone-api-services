class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    new_book = Book.new(book_params)

    if new_book.save
      render json: new_book, status: :created
    else
      render json: new_book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.permit(:title, :author)    # permit- only these params to be posted not others
  end
end
