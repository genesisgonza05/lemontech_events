require 'rails_helper'

describe 'User Authentication', type: :feature do
  let(:user) { create(:user) }

  it 'allows a user to sign in' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Ingresar'

    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
  end
end
