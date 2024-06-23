When('I fill in the login form with valid credentials') do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
end

When('I fill in the registration form with valid data') do
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Confirma tu password', with: 'password'
end

When('I click the logout link') do
  click_link 'Cerrar Sesión'
end

When('I update the profile form with valid data') do
  fill_in 'Email', with: 'newemail@example.com'
  fill_in 'Password', with: 'newpassword', match: :prefer_exact
  fill_in 'Confirma tu nuevo password', with: 'newpassword', match: :prefer_exact
  fill_in 'Password actual', with: @user.password, match: :prefer_exact
end
