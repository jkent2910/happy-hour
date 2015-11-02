FactoryGirl.define do

  factory :user do |u|
    u.email 'user@gmail.com'
    u.password 'password'
    u.password_confirmation 'password'
  end

end
