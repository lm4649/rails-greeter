class Contribution < ApplicationRecord
  belongs_to :card
  belongs_to :user, optional: true
  validates :contributor_name, presence: true, length: { minimum: 2 }
  validates :contributor_email, allow_blank: true, allow_nil: true, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/i }
  has_one_attached :photo

  def rejected?
    rejected
  end
end
