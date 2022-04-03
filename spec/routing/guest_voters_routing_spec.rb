require "rails_helper"

RSpec.describe GuestVotersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/guest_voters").to route_to("guest_voters#index")
    end

    it "routes to #new" do
      expect(get: "/guest_voters/new").to route_to("guest_voters#new")
    end

    it "routes to #show" do
      expect(get: "/guest_voters/1").to route_to("guest_voters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/guest_voters/1/edit").to route_to("guest_voters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/guest_voters").to route_to("guest_voters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/guest_voters/1").to route_to("guest_voters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/guest_voters/1").to route_to("guest_voters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/guest_voters/1").to route_to("guest_voters#destroy", id: "1")
    end
  end
end
