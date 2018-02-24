# frozen_string_literal: true

class Docs::Author
  include Swagger::Blocks

  swagger_schema :Author do
    property :author do
      key :format, :object

      property :id do
        key :type, :integer
      end
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :writing_style do
        key :type, :integer
      end
    end
  end

  swagger_schema :AuthorInput do
    key :required, [:author]

    property :author do
      key :format, :object
      key :required, [:name, :email, :writing_style]

      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :writing_style do
        key :type, :integer
      end
    end
  end

  swagger_schema :AuthorRef do
    property :id do
      key :type, :integer
    end
    property :name do
      key :type, :string
    end
    property :email do
      key :type, :string
    end
    property :writing_style do
      key :type, :integer
    end
  end
end
