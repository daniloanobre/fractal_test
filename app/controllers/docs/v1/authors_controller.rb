# frozen_string_literal: true

class Docs::V1::AuthorsController
  include Swagger::Blocks

  swagger_path "/authors" do

    operation :get do
      key :summary, "All Authors"
      key :description, "Returns all authors"
      key :operationId, "indexAuthors"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Authors"
      ]

      response 200 do
        key :description, "authors response"
      end
    end

    operation :post do
      key :description, "Creates a new author. Email is unique"
      key :operationId, "addAuthor"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Authors"
      ]

      parameter do
        key :in, :body
        key :name, :author
        key :description, "Add author"
        key :required, true
        schema do
          key :'$ref', :AuthorInput
        end
      end
      response 200 do
        key :description, "author response"
        schema do
          key :'$ref', :Author
        end
      end
    end
  end

  swagger_path "/authors/{id}" do
    operation :get do
      key :description, "Returns a single author"
      key :operationId, "findAuthorById"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Authors"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of author"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "author response"
        schema do
          key :'$ref', :Author
        end
      end
    end

    operation :put do
      key :description, "Update author informations"
      key :operationId, "updateAuthor"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Authors"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of author"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :author
        key :description, "Update author"
        key :required, true
        schema do
          key :'$ref', :AuthorInput
        end
      end

      response 200 do
        key :description, "author response"
        schema do
          key :'$ref', :Author
        end
      end
    end

    operation :delete do
      key :summary, "Delete an Author"
      key :description, "Delete an Author"
      key :operationId, "deleteAuthor"
      key :tags, [
        "Authors"
      ]


      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Author"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "author deleted"
      end
    end
  end

  swagger_path "/authors/{id}/books" do

    operation :get do
      key :summary, "All Books of one author"
      key :description, "Returns all books of one author"
      key :operationId, "indexBooks"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Authors"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of author"
        key :required, true
        key :type, :integer
      end

      response 200 do
        key :description, "books response"
      end
    end
  end
end
