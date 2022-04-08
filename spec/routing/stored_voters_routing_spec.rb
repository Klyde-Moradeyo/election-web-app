require "rails_helper"

RSpec.describe StoredVotersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stored_voters").to route_to("stored_voters#index")
    end

    it "routes to #new" do
      expect(get: "/stored_voters/new").to route_to("stored_voters#new")
    end

    it "routes to #show" do
      expect(get: "/stored_voters/1").to route_to("stored_voters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stored_voters/1/edit").to route_to("stored_voters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stored_voters").to route_to("stored_voters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stored_voters/1").to route_to("stored_voters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stored_voters/1").to route_to("stored_voters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stored_voters/1").to route_to("stored_voters#destroy", id: "1")
    end
  end
end
