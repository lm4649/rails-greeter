class Card < ApplicationRecord
  TEMPLATES = %w(bday1.jpg bday2.jpg wedding1.jpg wedding2.jpg wedding3.jpg wedding4.jpg cardproject.jpg)

  belongs_to :user
  has_many :contributions, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }, on: :update
  validates :event_date, presence: true
  validates :recipient_email, allow_blank: true, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/i }
  validate :event_date_in_future
  has_one_attached :photo

  def event_date_in_future
    errors.add(:event_date, 'must be in the future') if Date.today > event_date
  end
end
