class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    @auctions_w_bids = Auction.where(current_price: 2..Float::INFINITY)
  end
  def new
    @auction = Auction.new
  end
  def create
    @auction = Auction.new (auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render 'new'
    end
  end
  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @watch = @auction.watch_for(current_user)
  end
  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end
end
