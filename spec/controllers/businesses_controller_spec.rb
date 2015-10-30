require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do

  let(:valid_attributes) {
    {
      name: "Legends",
      website: "www.legends.com",
      start_time: "3:00 PM",
      end_time: "4:00 PM",
      address_attributes: {
        line1: "4457 Westwood Drive",
        city: "West Des Moines",
        state: "Iowa",
        zip: "50265"
        }
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      start_time: nil,
      end_time: nil
    }
  }

  let(:valid_session) { {} }

  context "businesses own profile" do
    describe "GET #index" do
      it "assigns all businesses as @businesses" do
        business = Business.create! valid_attributes
        get :index, {}, valid_session 
        expect(assigns(:businesses)).to include(business)
      end
    end

    describe "GET #show" do 
      it "assigns the requested business as @business" do 
        business = Business.create! valid_attributes
        get :show, {:id => business.to_param}, valid_session
        expect(assigns(:business)).to eq(business)
      end
    end

    describe "GET #new" do
      context "create a new business" do 
        it "assigns a new business as @business" do 
          get :new, {}, valid_session
          expect(assigns(:business)).to be_a_new(Business)
        end
      end
    end

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
end
