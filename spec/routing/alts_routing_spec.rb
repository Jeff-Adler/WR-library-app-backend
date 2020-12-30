require "rails_helper"

RSpec.describe AltsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/alts").to route_to("alts#index")
    end

    it "routes to #show" do
      expect(get: "/alts/1").to route_to("alts#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/alts").to route_to("alts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/alts/1").to route_to("alts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/alts/1").to route_to("alts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/alts/1").to route_to("alts#destroy", id: "1")
    end

    it "routes to #convert_to_book via PATCH" do
      expect(patch: "/alts/1/convert_to_book").to route_to("alts#convert_to_book", id: "1")
    end
  end
end
