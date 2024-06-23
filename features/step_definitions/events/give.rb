Given('I am on the new event page') do
  visit new_event_path
end

Given('an event exists') do
  @event = create(:event,
    user: @user,
    name: "Test Event",
    location: "Test Location",
    capacity: 100,
    event_date_time: DateTime.parse('2024-07-01T10:00'),
    description: "Test description",
    requirements: "Test requirements")
end

Given('events exist') do
  @events = create_list(:event, 3, user: @user)
end
