require 'rails_helper'

describe 'User Logout', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Ingresar'
  end

  it 'allows a logged in user to log out' do
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))

    click_link 'Cerrar Sesión'

    expect(page).to have_content(I18n.t('devise.failure.unauthenticated'))
    expect(page).not_to have_link('Cerrar Sesión')
  end
end
