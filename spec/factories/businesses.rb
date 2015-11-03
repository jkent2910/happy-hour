FactoryGirl.define do
  factory :business do
    name "Legends"
    start_time "3:00 PM"
    end_time "4:00 PM"
    website "www.legends.com"
    association :address, factory: :address 
  end
end
