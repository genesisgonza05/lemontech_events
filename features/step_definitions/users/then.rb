Then('I should see a message saying {string}') do |message|
  expect(page).to have_content(message)
end
