# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::AuthorsController, type: :controller do
  let(:valid_attributes) { build(:author).attributes }
  let(:valid_book_attributes) { build(:book).attributes }
  let(:invalid_attributes) {
    build(:author, name: nil).attributes
    build(:author, email: nil).attributes
    build(:author, writing_style: nil).attributes
  }

  describe "GET #index" do
    before { @author = Author.create! valid_attributes }
    before(:each) { get :index, params: {} }

    it "returns a success response" do
      expect(response).to be_success
      expect(response.content_type).to eq "application/json"
    end

    it "assigns all authors as @authors" do
      expect(assigns(:authors)).to include(@author)
    end
  end

  describe "GET #books" do
    context "with valid params" do
      before { @author = Author.create! valid_attributes }
      before { @book = Book.create! valid_book_attributes }
      before(:each) { get :books, params: { id: @author.to_param } }

      it "returns a success response" do
        expect(response).to be_success
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested author.books as @author.books" do
        expect(response.body).not_to be_blank
        expect(assigns(:author).books).to eq(@author.books)
      end

      it "exists license agreement in author" do
        expect(response.body).not_to be_blank
        expect(assigns(:author).library_agreement).to eq(@author.library_agreement)
      end
    end

    context "with invalid params" do
      before(:each) { get :books, params: { id: 3 } }

      it "returns a not found response" do
        expect(response).to be_not_found
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested author as nil" do
        expect(response.body).not_to be_blank
        expect(assigns(:author)).to be_nil
      end
    end
  end

  describe "GET #show" do
    context "with valid params" do
      before { @author = Author.create! valid_attributes }
      before(:each) { get :show, params: { id: @author.to_param } }

      it "returns a success response" do
        expect(response).to be_success
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested author as @author" do
        expect(response.body).not_to be_blank
        expect(assigns(:author)).to eq(@author)
      end

      it "exists license agreement in author" do
        expect(response.body).not_to be_blank
        expect(assigns(:author).library_agreement).to eq(@author.library_agreement)
      end
    end

    context "with invalid params" do
      before(:each) { get :show, params: { id: 3 } }

      it "returns a not found response" do
        expect(response).to be_not_found
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested author as nil" do
        expect(response.body).not_to be_blank
        expect(assigns(:author)).to be_nil
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Author" do
        expect {
          post :create, params: { author: valid_attributes }
        }.to change(Author, :count).by(1)
      end

      it "assigns a newly created author as @author" do
        post :create, params: { author: valid_attributes }
        expect(assigns(:author)).to be_a(Author)
        expect(assigns(:author)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved author as @author" do
        post :create, params: { author: invalid_attributes }
        expect(assigns(:author)).to be_a_new(Author)
      end
    end
  end

  describe "PUT #update" do
    before(:each) { @author = Author.create! valid_attributes }

    context "with valid params" do
      let(:new_attributes) { build(:author).attributes }

      it "updates the requested author" do
        put :update, params: { id: @author.to_param, author: new_attributes }
        @author.reload
      end

      it "assigns the requested author as @author" do
        put :update, params: { id: @author.to_param, author: valid_attributes }
        expect(assigns(:author)).to eq(@author)
      end
    end

    context "with invalid params" do
      it "assigns the author as @author" do
        put :update, params: { id: @author.to_param, author: invalid_attributes }
        expect(assigns(:author)).to eq(@author)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete :destroy, params: { id: author.to_param }
      }.to change(Author, :count).by(-1)
    end
  end
end
