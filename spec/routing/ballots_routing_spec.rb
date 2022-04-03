require "rails_helper"

RSpec.describe BallotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ballots").to route_to("ballots#index")
    end

    it "routes to #new" do
      expect(get: "/ballots/new").to route_to("ballots#new")
    end

    it "routes to #show" do
      expect(get: "/ballots/1").to route_to("ballots#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ballots/1/edit").to route_to("ballots#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ballots").to route_to("ballots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ballots/1").to route_to("ballots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ballots/1").to route_to("ballots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ballots/1").to route_to("ballots#destroy", id: "1")
    end
  end
end
