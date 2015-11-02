require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::TestHelpers 

  before do 
    user = FactoryGirl.create(:user)
    sign_in user
  end

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

    describe "GET #edit" do 
      it "assigns the requested business as @business" do 
        business = Business.create! valid_attributes
        get :show, {:id => business.to_param}, valid_session
        expect(assigns(:business)).to eq(business)
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

      context "with invalid params" do
        it "assigns a newly created but unsaved business as @business" do  
          post :create, {:business => invalid_attributes}, valid_session
          expect(assigns(:business)).to be_a_new(Business)
        end

        it "re-renders the 'new' template" do 
          post :create, {:business => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Legends",
          website: "www.legendsamericangrill.com",
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

      it "updates the requested business" do
        business = Business.create! valid_attributes
        put :update, {:id => business.to_param, :business => new_attributes}, valid_session
        business.reload
        expect(business.website).to eq("www.legendsamericangrill.com")
      end

      it "assigns the requested business as @business" do 
        business = Business.create! valid_attributes
        put :update, {:id => business.to_param, :business => valid_attributes}, valid_session
        expect(assigns(:business)).to eq(business)
      end

      it "redirects to the business" do 
        business = Business.create! valid_attributes
        put :update, {:id => business.to_param, :business => valid_attributes}, valid_session
        expect(response).to redirect_to(business)
      end 
    end
    context "with invalid params" do
      it "assigns the business as @business" do
        business = Business.create! valid_attributes
        put :update, {:id => business.to_param, :business => invalid_attributes}, valid_session
        expect(assigns(:business)).to eq(business)
      end

      it "re-renders the 'edit' template" do
        business = Business.create! valid_attributes
        put :update, {:id => business.to_param, :business => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end
end
