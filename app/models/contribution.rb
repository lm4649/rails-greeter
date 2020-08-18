class Contribution < ApplicationRecord
  belongs_to :card
  belongs_to :user
  validates :contributor_name, presence: true, length: { minimum: 2 }
end
