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

RSpec.describe "/raspberry_pi_updates", type: :request do
  # RaspberryPiUpdate. As you add validations to RaspberryPiUpdate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      RaspberryPiUpdate.create! valid_attributes
      get raspberry_pi_updates_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
      get raspberry_pi_update_url(raspberry_pi_update)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_raspberry_pi_update_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
      get edit_raspberry_pi_update_url(raspberry_pi_update)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RaspberryPiUpdate" do
        expect {
          post raspberry_pi_updates_url, params: { raspberry_pi_update: valid_attributes }
        }.to change(RaspberryPiUpdate, :count).by(1)
      end

      it "redirects to the created raspberry_pi_update" do
        post raspberry_pi_updates_url, params: { raspberry_pi_update: valid_attributes }
        expect(response).to redirect_to(raspberry_pi_update_url(RaspberryPiUpdate.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RaspberryPiUpdate" do
        expect {
          post raspberry_pi_updates_url, params: { raspberry_pi_update: invalid_attributes }
        }.to change(RaspberryPiUpdate, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post raspberry_pi_updates_url, params: { raspberry_pi_update: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested raspberry_pi_update" do
        raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
        patch raspberry_pi_update_url(raspberry_pi_update), params: { raspberry_pi_update: new_attributes }
        raspberry_pi_update.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the raspberry_pi_update" do
        raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
        patch raspberry_pi_update_url(raspberry_pi_update), params: { raspberry_pi_update: new_attributes }
        raspberry_pi_update.reload
        expect(response).to redirect_to(raspberry_pi_update_url(raspberry_pi_update))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
        patch raspberry_pi_update_url(raspberry_pi_update), params: { raspberry_pi_update: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested raspberry_pi_update" do
      raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
      expect {
        delete raspberry_pi_update_url(raspberry_pi_update)
      }.to change(RaspberryPiUpdate, :count).by(-1)
    end

    it "redirects to the raspberry_pi_updates list" do
      raspberry_pi_update = RaspberryPiUpdate.create! valid_attributes
      delete raspberry_pi_update_url(raspberry_pi_update)
      expect(response).to redirect_to(raspberry_pi_updates_url)
    end
  end
end
