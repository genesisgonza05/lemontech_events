class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  # Associations
  has_many :events, dependent: :destroy

  def events_ordered(column, direction)
    events.includes(:user).order(column + " " + direction)
  end


end
