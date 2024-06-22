FactoryBot.define do
  factory :event do
    name { 'Sample Event' }
    description { 'Event Description' }
    event_date_time { DateTime.now + 1.day }
    location { 'Sample Location' }
    capacity { 100 }
    requirements { 'Sample Requirements' }
    association :user
  end
end
