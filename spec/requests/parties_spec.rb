require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/parties", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Party. As you add validations to Party, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Party.create! valid_attributes
      get parties_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      party = Party.create! valid_attributes
      get party_url(party)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_party_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      party = Party.create! valid_attributes
      get edit_party_url(party)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Party" do
        expect {
          post parties_url, params: { party: valid_attributes }
        }.to change(Party, :count).by(1)
      end

      it "redirects to the created party" do
        post parties_url, params: { party: valid_attributes }
        expect(response).to redirect_to(party_url(Party.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Party" do
        expect {
          post parties_url, params: { party: invalid_attributes }
        }.to change(Party, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post parties_url, params: { party: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested party" do
        party = Party.create! valid_attributes
        patch party_url(party), params: { party: new_attributes }
        party.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the party" do
        party = Party.create! valid_attributes
        patch party_url(party), params: { party: new_attributes }
        party.reload
        expect(response).to redirect_to(party_url(party))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        party = Party.create! valid_attributes
        patch party_url(party), params: { party: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested party" do
      party = Party.create! valid_attributes
      expect {
        delete party_url(party)
      }.to change(Party, :count).by(-1)
    end

    it "redirects to the parties list" do
      party = Party.create! valid_attributes
      delete party_url(party)
      expect(response).to redirect_to(parties_url)
    end
  end
end
