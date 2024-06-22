When('I fill in the login form with valid credentials') do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
end

When('I fill in the registration form with valid data') do
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

When('I submit the form {string}') do |message|
  click_button message
end

When('I click the logout link') do
  click_link 'Cerrar Sesión'
end
