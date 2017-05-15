class Auction < ApplicationRecord
  has_many :bids

  validates :title, :details, :ends_on, :reserve_price, presence: true
  validates :title, uniqueness: true
end
