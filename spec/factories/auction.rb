FactoryGirl.define do
  factory(:auction) do
    aasm_state "draft"
    current_price BigDecimal.new("1.0")
    details "ToFactory: RubyParser exception parsing this attribute"
    ends_on "2017-05-16"
    reserve_price BigDecimal.new("50.0")
    title "cool firehose"
    user_id 1
  end
end
