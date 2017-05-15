class Bid < ApplicationRecord
  belongs_to :auction
  validates :auction_id, presence: true
  validates :amount, presence: true
end
