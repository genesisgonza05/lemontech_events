require 'rails_helper'

describe 'User Registration', type: :feature do
  it 'allows a user to register' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Registrar'

    expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
  end
end
