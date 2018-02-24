# frozen_string_literal: true

class Docs::Book
  include Swagger::Blocks

  swagger_schema :Book do
    property :book do
      key :format, :object

      property :id do
        key :type, :integer
      end
      property :title do
        key :type, :string
      end
      property :year do
        key :type, :integer
      end
    end
  end

  swagger_schema :BookInput do
    key :required, [:book]

    property :book do
      key :format, :object
      key :required, [:title, :year]

      property :title do
        key :type, :string
      end
      property :year do
        key :type, :integer
      end
    end
  end

  swagger_schema :BookRef do
    property :id do
      key :type, :integer
    end
    property :title do
      key :type, :string
    end
    property :year do
      key :type, :integer
    end
  end
end
