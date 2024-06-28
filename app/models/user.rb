class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participated_events, through: :participations, source: :event

  def events_ordered_with_ransack(sort = Event::DEFAULT_SORT, direction = Event::DEFAULT_DIR, search = Event::DEFAULT_SEARCH)
    events
      .includes(:user)
      .order("#{Event.sort_column(sort)} #{Event.sort_direction(direction)}")
      .ransack(search)
  end
end
