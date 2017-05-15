FactoryGirl.define do
  factory :bid do
    references "auction"
    amount "200"
  end
end
