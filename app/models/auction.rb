class Auction < ApplicationRecord
  include AASM
  has_many :bids
  belongs_to :user
  validates :title, :details, :ends_on, :reserve_price, presence: true
  validates :title, uniqueness: true

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :canceled
    state :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

  end
end
