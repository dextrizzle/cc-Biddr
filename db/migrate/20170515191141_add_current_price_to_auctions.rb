class AddCurrentPriceToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :current_price, :money
  end
end
