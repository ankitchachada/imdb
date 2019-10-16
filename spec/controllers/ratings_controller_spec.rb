require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Rating. As you add validations to Rating, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RatingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Rating.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      rating = Rating.create! valid_attributes
      get :show, params: {id: rating.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      rating = Rating.create! valid_attributes
      get :edit, params: {id: rating.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Rating" do
        expect {
          post :create, params: {rating: valid_attributes}, session: valid_session
        }.to change(Rating, :count).by(1)
      end

      it "redirects to the created rating" do
        post :create, params: {rating: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Rating.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {rating: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: new_attributes}, session: valid_session
        rating.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: valid_attributes}, session: valid_session
        expect(response).to redirect_to(rating)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rating" do
      rating = Rating.create! valid_attributes
      expect {
        delete :destroy, params: {id: rating.to_param}, session: valid_session
      }.to change(Rating, :count).by(-1)
    end

    it "redirects to the ratings list" do
      rating = Rating.create! valid_attributes
      delete :destroy, params: {id: rating.to_param}, session: valid_session
      expect(response).to redirect_to(ratings_url)
    end
  end

end
