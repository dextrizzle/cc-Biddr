require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
    # auction = FactoryGirl.create(:auction, user: user)
  end

  # let(:auction) { FactoryGirl.create(:auction, { user: FactoryGirl.create(:user) }) }

  describe '#new' do
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
    before do
      get :index
    end

    it 'responds with HTTP 200 status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the #index template' do
      expect(response).to render_template(:index)
    end
  end
  describe '#create' do
    context 'with valid params' do
      def valid_auction_params
        post :create, params: { auction: FactoryGirl.attributes_for(:auction) }
      end

      it 'creates a new auction in the database' do
        expect do
          valid_auction_params
        end.to change { Auction.count }.by(1)
      end

      it 'redirects to auction#show' do
        valid_auction_params
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end

    context 'with invalid params' do
      def invalid_auction_params
        post :create, params: { auction: FactoryGirl.attributes_for(:auction, title:nil) }
      end

      it 'doesn\'t create a new auction in the database' do
        expect do
          invalid_auction_params
        end.to_not change { Auction.count }
      end

      it 'renders #new template' do
        invalid_auction_params
        expect(response).to render_template(:new)
      end
    end
  end
  describe '#show' do
    before do
      post :create, params: { auction: FactoryGirl.attributes_for(:auction) }
      get :show, params: { id: Auction.last.id }
    end
    it 'instantiates an auction object with id' do
      expect(assigns(:auction)).to eq(Auction.last)
    end
    it 'renders the #show template' do
      expect(response).to render_template(:show)
    end
  end
end