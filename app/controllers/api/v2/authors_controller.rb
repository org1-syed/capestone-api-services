module Api
    module V2

        class AuthorsController < ApplicationController

            before_action :ensure_json_request, only: :create
            
            def index
                render json: Author.all.order(:first_name)
            end

            def show
                author = Author.find_by(id: params[:id])
                unless author.blank?
                    render json: author
                else
                    render plain: 'Author not found', status: :not_found
                end
            end

            def create
                new_author = Author.new(author_params)
                if new_author.save
                    render json: new_author, status: :created
                else
                    render json: new_author.errors, status: :unprocessable_entity
                end
            end

            private

            def author_params
                params.permit(:first_name, :last_name, :age)    #.merge(:book)
            end
        end

    end
end
