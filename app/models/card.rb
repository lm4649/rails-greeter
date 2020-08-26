class Card < ApplicationRecord
  TEMPLATES = %w(bday1.jpg bday2.jpg wedding1.jpg wedding2.jpg wedding3.jpg wedding4.jpg beach.jpg beer.jpg darkwood.jpg map.jpg officedesk.jpg woodendesk.jpg christmas1.jpg christmas2.jpg christmas3.jpg)

  belongs_to :user
  has_many :contributions, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }, on: :update
  validates :event_date, presence: true
  validates :recipient_email, allow_blank: true, format: { with: /\A.*@.*\.com\z/ }
  validate :event_date_in_future
  has_one_attached :photo

  def event_date_in_future
    errors.add(:event_date, 'must be in the future') if Date.today > event_date
  end
end
