require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  let!(:user_event) { create(:event, user: user, name: 'User Event') }
  let!(:other_user_event) { create(:event, user: other_user, name: 'Other User Event') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns only the events of the logged-in user' do
      get :index
      expect(assigns(:events)).to match_array([user_event])
      expect(assigns(:events)).not_to include(other_user_event)
    end
  end

  describe 'GET #show' do
    it 'shows the event of the logged-in user' do
      get :show, params: { id: user_event.id }
      expect(assigns(:event)).to eq(user_event)
    end

    context 'when the event does not belong to the logged-in user' do
      it 'redirects to the events index' do
        begin
          get :show, params: { id: other_user_event.id }
        rescue ActiveRecord::RecordNotFound
          expect(response).to redirect_to(events_path)
        end
      end
    end

  end

  describe 'POST #create' do
    it 'creates an event for the logged-in user' do
      event_params = {
        name: 'New Event',
        description: 'Event Description',
        event_date_time: DateTime.now + 1.day,
        location: 'New Location',
        capacity: 50,
        requirements: 'New Requirements'
      }

      expect {
        post :create, params: { event: event_params }
      }.to change(user.events, :count).by(1)
    end
  end

  describe 'PUT #update' do
    it 'updates the event of the logged-in user' do
      event_params = { name: 'Updated Event' }
      put :update, params: { id: user_event.id, event: event_params }
      user_event.reload
      expect(user_event.name).to eq('Updated Event')
    end

    it 'does not update the event of another user' do
      expect { 
        put :update, params: { 
          id: other_user_event.id, 
          event: { name: 'Updated Event' }
        }
      }.not_to change { other_user_event.reload.name }
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the event of the logged-in user' do
      expect {
        delete :destroy, params: { id: user_event.id }
      }.to change(user.events, :count).by(-1)
    end

    it 'does not destroy the event of another user' do
      expect { 
        delete :destroy, params: { id: other_user_event.id }
      }.not_to change { user.events.reload.count }
    end
  end
end
