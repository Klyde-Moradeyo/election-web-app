require "rails_helper"

RSpec.describe OptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/questions/1/options").to route_to("options#index", question_id: "1")
    end

    it "routes to #new" do
      expect(get: "/questions/1/options/new").to route_to("options#new", question_id: "1")
    end

    it "routes to #show" do
      expect(get: "/options/1").to route_to("options#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/options/1/edit").to route_to("options#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/questions/1/options").to route_to("options#create", question_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/options/1").to route_to("options#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/options/1").to route_to("options#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/options/1").to route_to("options#destroy", id: "1")
    end
  end
end
