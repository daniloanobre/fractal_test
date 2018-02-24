# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::AuthorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/v1/authors").to route_to("api/v1/authors#index")
    end


    it "routes to #show" do
      expect(get: "/v1/authors/1").to route_to("api/v1/authors#show", id: "1")
    end

    it "routes to #show" do
      expect(get: "/v1/authors/1/books").to route_to("api/v1/authors#books", id: "1")
    end

    it "routes to #create" do
      expect(post: "/v1/authors").to route_to("api/v1/authors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/authors/1").to route_to("api/v1/authors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/authors/1").to route_to("api/v1/authors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/authors/1").to route_to("api/v1/authors#destroy", id: "1")
    end

  end
end
