class BooksController < ApplicationController

  before_action :set_book, only: [:show, :destroy]

  def index
    render json: Book.all
  end

  def show
    render json: @book
  end

  def create
    new_book = Book.new(book_params)

    if new_book.save
      render json: new_book, status: :created
    else
      render json: new_book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    head :no_content
  end

  private

  def book_params
    params.permit(:title, :author)    # permit- only these params to be posted not others
  end

  def set_book
    @book = Book.find_by(id: params[:id])
    render plain: 'Book not found', status: :not_found if @book.blank?
  end
end
