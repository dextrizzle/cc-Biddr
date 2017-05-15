class Auction < ApplicationRecord
  include AASM
  has_many :bids
  has_many :watches, dependent: :destroy
  has_many :users, through: :watches
  belongs_to :user
  validates :title, :details, :ends_on, :reserve_price, presence: true
  validates :title, uniqueness: true
  before_create do
    self.current_price = 1
  end
  def watch_for(user)
    watches.find_by_user_id(user)
  end
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
