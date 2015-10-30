require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do

  let(:valid_attributes) {
    {
      name: "Legends",
      website: "www.legends.com",
      line1: "4457 Westwood Drive",
      city: "West Des Moines",
      state: "Iowa",
      zip: "50265"
    }
  }

  let(:valid_session) { {} }

      describe "POST #create" do
      context "with valid params" do
        it "creates a new Business" do
          expect {
            post :create, {:business => valid_attributes}, valid_session
          }.to change(Business, :count).by(1)
        end

        it "assigns a newly created business as @business" do
          post :create, {:business => valid_attributes}, valid_session
          expect(assigns(:business)).to be_a(Business)
          expect(assigns(:business)).to be_persisted
        end

        it "redirects to the created business" do
          post :create, {:business => valid_attributes}, valid_session
          expect(response).to redirect_to(Business.last)
        end
      end
    end

end
