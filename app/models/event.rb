class Event < ApplicationRecord
  PER_PAGE = 5.freeze

  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :event_date_time, presence: true
  validates :location, presence: true, length: { maximum: 255 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :requirements, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id name event_date_time capacity]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
