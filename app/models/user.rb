class User < ApplicationRecord
  include EventsHelper
  DEFAULT_DIR = "desc".freeze
  DEFAULT_SORT = "id".freeze
  DEFAULT_SEARCH = "".freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :events, dependent: :destroy

  def events_ordered_with_ransack(sort = DEFAULT_SORT, direction = DEFAULT_DIR, search = DEFAULT_SEARCH)
    events
      .includes(:user)
      .order(sort_column(sort) + " " + sort_direction(direction))
      .ransack(search)
  end
end
