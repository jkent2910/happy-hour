FactoryGirl.define do
  factory :business do
    name "Legends"
    start_time "3:00 PM"
    end_time "4:00 PM"
    website "www.legends.com"
    association :address, factory: :address 

    factory :business_with_special do
      after(:create) do |business|
        create(:special, business: business)
      end
    end
  end
end
