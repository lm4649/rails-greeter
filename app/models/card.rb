class Card < ApplicationRecord
  belongs_to :user
  has_many :contributions, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
  validates :event_date, presence: true
  validate :event_date_in_future

  def event_date_in_future
    errors.add(:event_date, 'event date must be in the future') if Date.today > event_date
  end
end
