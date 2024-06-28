require 'rails_helper'

RSpec.describe ParticipationsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event) }
  let(:participation) { create(:participation, user: user, event: event) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'when the user is not registered for the event' do
      it 'registers the user for the event' do
        expect {
          post :create, params: { event_id: event.id }
        }.to change(event.participations, :count).by(1)
        expect(response).to redirect_to(events_path(all: true))
        expect(flash[:notice]).to eq("Te has registrado en el evento exitosamente.")
      end
    end

    context 'when the user is already registered for the event' do
      before do
        create(:participation, user: user, event: event)
      end

      it 'does not register the user again' do
        expect {
          post :create, params: { event_id: event.id }
        }.not_to change(event.participations, :count)
        expect(response).to redirect_to(events_path(all: true))
        expect(flash[:alert]).to eq("No puedes registrarte dos veces en el mismo evento.")
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the user is registered for the event' do
      let!(:participation) { create(:participation, user: user, event: event) }

      it 'cancels the registration' do
        expect {
          delete :destroy, params: { event_id: event.id, id: participation.id }
        }.to change(event.participations, :count).by(-1)
        expect(response).to redirect_to(events_path(all: true))
        expect(flash[:notice]).to eq("Has cancelado tu registro en el evento.")
      end
    end

    context 'when the user is not registered for the event' do
      let(:other_event) { create(:event) }

      it 'does not cancel the registration' do
        expect {
          delete :destroy, params: { event_id: other_event.id, id: participation.id }
        }.not_to change(other_event.participations, :count)
        expect(response).to redirect_to(events_path(all: true))
        expect(flash[:alert]).to eq("No estás registrado en este evento.")
        puts "Flash alert: #{flash[:alert]}"  # Añadir mensaje de depuración
      end
    end
  end
end
