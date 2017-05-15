class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  validates :auction_id, presence: true
  validates :amount, presence: true
  validate :amount_greater

  def amount_greater
    # puts "#{amount} #{auction.current_price}"
    if amount.present? &&
        auction.present? &&
        amount <= auction.current_price
      errors.add(:amount, "must be greater than the auction's current price")
    end
  end

  after_commit do
    auction.update_attribute(:current_price, self.amount)
    if(self.amount > auction.reserve_price)
      auction.update_attribute(:aasm_state, 'reserve_met')
    end
  end

end
