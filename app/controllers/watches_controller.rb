class WatchesController < ApplicationController
  def create
    watch = current_user.watches.new
    auction = Auction.find params[:auction_id]
    watch.auction = auction
    if watch.save
      redirect_to auction, notice: "Watched!"
    else
      redirect_to auction, alert: "Can't Watch!"
    end
  end

  def destroy
    watch = current_user.watches.find params[:id]
    watch.destroy
    auction = Auction.find params[:auction_id]
    redirect_to auction, notice: "Unwatched"
  end
end
