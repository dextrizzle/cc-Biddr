class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  validates :auction_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: :auction_current }

  def auction_current
    auction.current_price
  end

  after_save do
    auction.current_price = self.amount
  end
end
