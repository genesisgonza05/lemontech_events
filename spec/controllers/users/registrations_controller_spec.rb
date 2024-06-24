require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'when reCAPTCHA is valid' do
      before do
        allow(controller).to receive(:verify_recaptcha).and_return(true)
      end

      it 'allows user registration' do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end
    end

    context 'when reCAPTCHA is invalid' do
      before do
        allow(controller).to receive(:verify_recaptcha).and_return(false)
      end

      it 'does not allow user registration' do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to render_template(:new)
      end

      it 'discards the recaptcha error flash' do
        post :create, params: { user: attributes_for(:user) }
        expect(flash[:recaptcha_error]).to be_nil
      end
    end
  end
end
