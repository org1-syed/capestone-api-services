class BooksController < ApplicationController

  before_action :ensure_json_request, only: [:create, :update]
  before_action :set_book, only: [:show, :destroy, :update]

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

  def update
    if @book.update(title: params[:title], author: params[:author])
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
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
