require "rails_helper"

RSpec.describe AuthorBooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/author_books").to route_to("author_books#index")
    end

    it "routes to #show" do
      expect(get: "/author_books/1").to route_to("author_books#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/author_books").to route_to("author_books#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/author_books/1").to route_to("author_books#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/author_books/1").to route_to("author_books#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/author_books/1").to route_to("author_books#destroy", id: "1")
    end
  end
end
