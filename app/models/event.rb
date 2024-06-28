class Event < ApplicationRecord
  PER_PAGE = 5.freeze
  DEFAULT_DIR = "desc".freeze
  DEFAULT_SORT = "id".freeze
  DEFAULT_SEARCH = "".freeze

  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :event_date_time, presence: true
  validates :location, presence: true, length: { maximum: 255 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :requirements, presence: true
  validate :event_date_time_in_future

  scope :not_current_user_ordered_with_ransack, ->(user_id, sort = DEFAULT_SORT, direction = DEFAULT_DIR, search = DEFAULT_SEARCH) {
    includes(:user)
      .where.not(user_id: user_id)
      .order("#{sort_column(sort)} #{sort_direction(direction)}")
      .ransack(search)
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[id name event_date_time capacity]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.sort_column(sort_value)
    %w[event_date_time name location capacity].include?(sort_value) ? sort_value : DEFAULT_SORT
  end

  def self.sort_direction(direction_value)
    %w[asc desc].include?(direction_value) ? direction_value : DEFAULT_DIR
  end

  private

  def event_date_time_in_future
    if event_date_time.present? && event_date_time <= Time.current
      errors.add(:event_date_time, I18n.t("activerecord.errors.models.event.attributes.event_date_time.time_in_pass"))
    end
  end
end
