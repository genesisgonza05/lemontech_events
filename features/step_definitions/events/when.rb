When('I fill in the event form with valid data') do
  fill_in 'Nombre del evento', with: 'Test Event'
  fill_in 'Ubicación del evento', with: 'Test Location'
  fill_in 'Fecha y hora', with: '2024-07-01 10:00'
  fill_in 'Capacidad del evento', with: 100
  fill_in 'Descripción del evento', with: 'Test description'
  fill_in 'Requisitos del evento', with: 'Test requirements'
end

When('I delete the event') do
  visit event_path(@event)
  click_button 'Eliminar'
end

When('I go to the edit event page') do
  visit edit_event_path(@event)
end

When('I go to the events page') do
  visit events_path
end

When('I go to the event page') do
  visit event_path(@event)
end
