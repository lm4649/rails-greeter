class Card < ApplicationRecord

  TEMPLATES = %w(bday1.jpg bday2.jpg wedding1.jpg wedding2.jpg wedding3.jpg wedding4.jpg beach.jpg beer.jpg darkwood.jpg map.jpg officedesk.jpg woodendesk.jpg christmas1.jpg christmas2.jpg christmas3.jpg)

  SONGS = {
    Celebration: "3K7Q9PHUWPTaknlbFPThn2",
    Romantic: "5tdKaKLnC4SgtDZ6RlWeal",
    Chill: "1vsZ486MmylerIHEiHHHOd",
    Grateful: "1Gmz7Q8cpMFFWd9eONMlKO",
    Wedding: "2jZ8Cb29rIqjNUsHoSYsGC"
  }


  belongs_to :user
  has_many :contributions, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }, on: :update
  validates :description, presence: true
  validates :event_date, presence: true
  validates :recipient_email, presence: true, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/i }
  validate :event_date_in_future
  has_one_attached :photo

  def event_date_in_future
    errors.add(:event_date, 'must be in the future') if Date.today > event_date
  end
end
