# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Authors", type: :request do
  let(:valid_author_attrs) { { author: attributes_for(:author) } }
  let(:invalid_author_attrs) { { author: attributes_for(:author,  name: nil) } }

  describe "/v1/authors" do
    context "GET" do
      before { create_list(:author, 3) }
      before(:each) { get v1_authors_path }

      it "should be returns success" do
        expect(response).to have_http_status(200)
      end

      it "validate serializer" do
        expect(response).to match_response_schema("authors")
      end

      it "should be returns a authors list" do
        expect(response.body).not_to be_blank
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).count).to be >= 1
      end

      context "with starts_with params" do
        let(:author) { create_list(:author, 3) }
        before { @author = Author.create! attributes_for(:author, name: "Danilo") }
        before(:each) { get v1_authors_path, params: { starts_with: "D" } }

        it "returns a success response" do
          expect(response).to be_success
          expect(response.content_type).to eq "application/json"
        end

        it "assigns filtered authors as @authors" do
          expect(assigns(:authors)).to include(@author)
          expect(assigns(:authors).count).to be >= 1
          expect(JSON.parse(response.body).first["name"]).to starting_with("D")
        end
      end
    end

    context "POST" do
      context "valid_author_attrs" do
        before(:each) { post v1_authors_path, params: valid_author_attrs }

        it "should be returns a author created" do
          expect(response).to have_http_status(201)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("author_with_library_agreement_and_books")
        end

        it_behaves_like "an author with library agreement and books attributes" do
          let(:body) { JSON.parse(response.body) }
          let(:attrs) { valid_author_attrs.as_json }
        end
      end

      context "invalid_author_attrs" do
        describe "invalid author params" do
          before(:each) { post v1_authors_path, params: invalid_author_attrs }

          it_behaves_like "a unprocessable error", :authors
        end
      end
    end

    describe "/v1/authors/id" do
    let(:author) { create(:author) }

    context "GET" do
      context "valid_author_attrs" do
        before(:each) { get v1_author_path(author.id) }

        it "should be returns success" do
          expect(response.content_type).to eq("application/json")
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("author_with_library_agreement_and_books")
        end

        it "should be returns an author" do
          expect(response.body).not_to be_blank
          expect(JSON.parse(response.body)).not_to be_empty
        end

        it_behaves_like "an author with library agreement and books attributes" do
          let(:body) { JSON.parse(response.body) }
          let(:attrs) { { "author": author }.as_json }
        end
      end

      context "invalid_author_attrs" do
        before(:each) { get v1_author_path(1000) }

        it_behaves_like "a not found error", :author, 1000
      end
    end

    context "PUT" do
      let(:new_valid_author_attrs) { valid_author_attrs }

      context "valid_author_attrs" do
        before(:each) { put v1_author_path(author.id), params: new_valid_author_attrs }

        it "should be returns success" do
          expect(response.content_type).to eq("application/json")
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("author_with_library_agreement_and_books")
        end

        it_behaves_like "an author with library agreement and books attributes" do
          let(:body) { JSON.parse(response.body) }
          let(:attrs) { new_valid_author_attrs.as_json }
        end
      end

      context "invalid_author_attrs" do
        describe "invalid id" do
          before(:each) { put v1_author_path(1000), params: new_valid_author_attrs }

          it_behaves_like "a not found error", :author, 1000
        end

        describe "invalid params" do
          before(:each) { put v1_author_path(author.id), params: invalid_author_attrs }

          it_behaves_like "a unprocessable error", :author
        end
      end
    end

    context "PATCH" do
      let(:new_valid_author_attrs) { valid_author_attrs }

      context "when logged in" do
        context "valid_author_attrs" do
          before(:each) { patch v1_author_path(author.id), params: new_valid_author_attrs }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate serializer" do
            expect(response).to match_response_schema("author_with_library_agreement_and_books")
          end

          it_behaves_like "an author with library agreement and books attributes" do
            let(:body) { JSON.parse(response.body) }
            let(:attrs) { new_valid_author_attrs.as_json }
          end
        end

        context "invalid_author_attrs" do
          describe "invalid id" do
            before(:each) { patch v1_author_path(1000), params: new_valid_author_attrs }

            it_behaves_like "a not found error", :author, 1000
          end

          describe "invalid params" do
            before(:each) { patch v1_author_path(author.id), params: invalid_author_attrs }

            it_behaves_like "a unprocessable error", :author
          end
        end
      end
    end

    context "DELETE" do
      context "valid_author_attrs" do
        before(:each) { delete v1_author_path(author.id) }

        it "should destroy a author" do
          expect(response.body).to be_empty
          expect(response).to have_http_status(204)
        end
      end

      context "invalid_author_attrs" do
        before(:each) { delete v1_author_path(1000) }

        it_behaves_like "a not found error", :author, 1000
      end
    end
  end
  end
end
