class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :event_date_time, presence: true
  validates :location, presence: true, length: { maximum: 255 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :requirements, presence: true
end
