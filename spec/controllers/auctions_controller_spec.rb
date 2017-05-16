require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  describe '#new' do
  before { controller.stub(:authenticate_user!).and_return true }

    before do
      get :new
    end

    let(:auction) { FactoryGirl.create(:auction) }

    it 'instantiates a new auction object' do
      expect(assigns(:auction)).to be_a_new(Auction)
    end

    it 'renders the #new template' do
      expect(response).to render_template(:new)
    end

  end
  describe '#index' do
    before { controller.stub(:authenticate_user!).and_return true }
    
    let(:auction) { FactoryGirl.create(:auction) }

    it 'gets a HTTP 302 response' do
      get :index
      expect(response).to have_http_status(302)
    end
    it 'renders index template' do
      get :index
      expect(response).to render_template(user_session_path)
    end
  end
  describe '#create' do
    before { controller.stub(:authenticate_user!).and_return true }

    context 'with invalid params' do
      def invalid_auction_params
        post :create, params: { auction: FactoryGirl.attributes_for(:auction, title:nil) }
      end

      it 'doesn\'t create a new auction in the database' do
        expect do
          invalid_auction_params
        end.to_not change { Auction.count }
      end

      it 'renders auction#new' do
        invalid_auction_params
        expect(response).to render_template(:new)
      end
    end
  end
end