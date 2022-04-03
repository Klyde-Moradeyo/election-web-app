require "rails_helper"

RSpec.describe BallotResultsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ballot_results").to route_to("ballot_results#index")
    end

    it "routes to #new" do
      expect(get: "/ballot_results/new").to route_to("ballot_results#new")
    end

    it "routes to #show" do
      expect(get: "/ballot_results/1").to route_to("ballot_results#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ballot_results/1/edit").to route_to("ballot_results#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ballot_results").to route_to("ballot_results#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ballot_results/1").to route_to("ballot_results#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ballot_results/1").to route_to("ballot_results#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ballot_results/1").to route_to("ballot_results#destroy", id: "1")
    end
  end
end
