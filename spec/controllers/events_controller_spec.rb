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

  describe 'GET #new' do
    context 'when user is signed in' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'assigns a new Event to @event' do
        get :new
        expect(assigns(:event)).to be_a_new(Event)
      end

      it 'assigns the event to the current user' do
        get :new
        expect(assigns(:event).user).to eq(@user)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
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

    context 'with valid attributes' do
      it 'creates a new event and redirects to the event show page with a notice' do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to(event_url(assigns(:event)))
        expect(flash[:notice]).to eq('Event was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new event and re-renders the new template with unprocessable entity status' do
        post :create, params: { event: attributes_for(:event, name: nil) }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #edit' do
    before do
      @user = create(:user)
      @event = create(:event, user: @user)
      sign_in @user
    end

    context 'when params[:view] is "show"' do
      it 'sets @view to "show" and @back_path to event_path' do
        get :edit, params: { id: @event.id, view: 'show' }
        expect(assigns(:view)).to eq('show')
        expect(assigns(:back_path)).to eq(event_path(@event))
      end
    end

    context 'when params[:view] is not "show"' do
      it 'sets @view to the given value and @back_path to events_path' do
        get :edit, params: { id: @event.id, view: 'list' }
        expect(assigns(:view)).to eq('list')
        expect(assigns(:back_path)).to eq(events_path)
      end
    end

    context 'when params[:view] is nil' do
      it 'sets @view to "list" and @back_path to events_path' do
        get :edit, params: { id: @event.id }
        expect(assigns(:view)).to eq('list')
        expect(assigns(:back_path)).to eq(events_path)
      end
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

    context 'with valid attributes' do
      it 'updates the event and redirects to the event show page with a notice' do
        patch :update, params: { id: user_event.id, event: { name: 'Updated Event Name' } }
        expect(response).to redirect_to(event_url(user_event))
        expect(flash[:notice]).to eq('Event was successfully updated.')
        user_event.reload
        expect(user_event.name).to eq('Updated Event Name')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the event and re-renders the edit template with unprocessable entity status' do
        patch :update, params: { id: user_event.id, event: { name: nil } }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
        user_event.reload
        expect(user_event.name).not_to be_nil
      end
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
