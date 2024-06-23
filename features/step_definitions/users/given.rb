Given('I am a registered user') do
  @user = create(:user)
end

Given('I am on the login page') do
  visit new_user_session_path
end

Given('I am on the registration page') do
  visit new_user_registration_path
end

Given('I am logged in') do
  @user = create(:user)
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Ingresar'
  expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
end

Given('I am on the profile page') do
  visit edit_user_registration_path
end


