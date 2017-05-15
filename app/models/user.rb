class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :auctions
  has_many :bids
  has_many :watches, dependent: :destroy
  has_many :watched_auctions, through: :watches, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
