require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe '#create' do
    let(:auction) { FactoryGirl.create(:auction) }

    context 'with valid params' do
      def valid_bid_params
        post :create, params: { auction_id: auction.id, bid: FactoryGirl.attributes_for(:bid) }
      end

      it 'creates a bid in the database' do
        expect do
          valid_bid_params
        end.to change { Bid.count }.by(1)
      end

      it 'associates the bid with the auction' do
        valid_bid_params
        expect(Bid.last.auction).to be_present
      end

      it 'shows the auction page' do
        valid_bid_params
        expect(response).to redirect_to auction_path(auction)
      end
    end

    context 'with invalid params' do
      def invalid_bid_params
        post :create, params: { auction_id: auction.id, bid: FactoryGirl.attributes_for(:bid, amount:nil) }
      end

      it 'doesn\'t create a bid in the database' do
        expect do
          invalid_bid_params
        end.to_not change { Bid.count }
      end

      it 'shows the auction page' do
        invalid_bid_params
        expect(response).to render_template 'auctions/show'
      end
    end

  end
end
