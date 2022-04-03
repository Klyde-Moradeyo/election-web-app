require "rails_helper"

RSpec.describe QuestionResultsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/question_results").to route_to("question_results#index")
    end

    it "routes to #new" do
      expect(get: "/question_results/new").to route_to("question_results#new")
    end

    it "routes to #show" do
      expect(get: "/question_results/1").to route_to("question_results#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/question_results/1/edit").to route_to("question_results#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/question_results").to route_to("question_results#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/question_results/1").to route_to("question_results#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/question_results/1").to route_to("question_results#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/question_results/1").to route_to("question_results#destroy", id: "1")
    end
  end
end
