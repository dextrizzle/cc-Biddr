class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :details
      t.date :ends_on
      t.money :reserve_price

      t.timestamps
    end
  end
end
