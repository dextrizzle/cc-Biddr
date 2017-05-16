require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe '#create' do
    before { controller.stub(:authenticate_user!).and_return true }
      # @auction = FactoryGirl.create(:auction)
      let(:user) { FactoryGirl.create(:user)}
      let(:auction) { FactoryGirl.create(:auction, user_id: user.id) }
    # let(:user) { FactoryGirl.create(:user)}
    # let(:auction) { FactoryGirl.create(:auction, user_id: :user.id) }



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
