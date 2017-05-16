FactoryGirl.define do
  factory(:bid) do
    amount BigDecimal.new("25.0")
    auction_id 2
    user_id 1
  end
end
