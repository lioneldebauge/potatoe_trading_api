FactoryBot.define do
  factory :price do
    time { Time.new(2022, 12, 3) }
    value { 1000 }
  end
end