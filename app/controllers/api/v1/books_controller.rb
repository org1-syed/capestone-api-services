module Api
  module V1

    class BooksController < ApplicationController

      before_action :ensure_json_request, only: [:create, :update]
      before_action :set_book, only: [:show, :destroy, :update]

      rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

      def index
        offset = params[:offset].try(:to_i) || 0
        limit = params[:limit].try(:to_i) || 20

        return render plain: 'limit must be between 1 and 100', status: :bad_request unless limit.between?(1, 100)

        return render plain: 'offset must be greater than or equal to 0', status: :bad_request if offset.negative?
        books = Book.all.limit(limit).offset(offset).order(:title)
        render json: BooksRepresentor.new(books).as_json

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
        if @book.update(title: params[:title])
          head :no_content
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.permit(:title)    # permit- only these params to be posted not others
      end

      def set_book
        @book = Book.find_by(id: params[:id])
        render plain: 'Book not found', status: :not_found if @book.blank?
      end
    end
  end
end
