Then('I should see the event details') do
  expect(page).to have_content('Test Event')
  expect(page).to have_content('Test Location')
  expect(page).to have_content('01/07/2024 10:00')
  expect(page).to have_content('100')
  expect(page).to have_content('Test description')
  expect(page).to have_content('Test requirements')
end

Then('the event should no longer exist') do
  visit events_path
  expect(page).not_to have_content(@event.name)
end

Then('I should see the updated event details') do
  expect(page).to have_content('Test Event')
  expect(page).to have_content('Test Location')
  expect(page).to have_content('01/07/2024 10:00')
  expect(page).to have_content('100')
  expect(page).to have_content('Test description')
  expect(page).to have_content('Test requirements')
end

Then('I should see a list of events') do
  @events.each do |event|
    expect(page).to have_content(event.name)
    expect(page).to have_content(long_formatted_date_time(event.event_date_time))
    expect(page).to have_content(event.capacity)
  end
end
