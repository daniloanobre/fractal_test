# frozen_string_literal: true

module Api::V1
  class AuthorsController < ApplicationController
    include AuthorsHelper
    before_action :set_author, only: [:show, :update, :destroy, :books]

    # GET /authors
    def index
      # without cache
      # @authors = Author.where("name LIKE ?", "#{params[:starts_with]}%")

      search = params[:keywords].present? ? params[:keywords] : '*'
      @authors = Author.search(search, fields: [:name, :email], match: :word_start)
      
      # with cache
      # fetch_authors

      render json: @authors
    end

    # GET /authors/1
    def show
      render json: @author, serializer: Authors::AuthorWithLibraryAgreementSerializer
    end

    # POST /authors
    def create
      @author = Author.new(author_params)

      if @author.save
        # Sends email to author when author is created.
        SendEmailToAuthorJob.perform_now(@author)

        render json: @author, status: :created, serializer: Authors::AuthorWithLibraryAgreementSerializer
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /authors/1
    def update
      if @author.update(author_params)
        render json: @author, serializer: Authors::AuthorWithLibraryAgreementSerializer
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end

    # DELETE /authors/1
    def destroy
      @author.destroy
    end

    def books
      render json: @author.books
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def author_params
        params.require(:author).permit(:name, :email, :writing_style, library_agreement_attributes: [:id, :starting_date, :duration])
      end
  end
end
