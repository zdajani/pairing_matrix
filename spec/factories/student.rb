FactoryGirl.define do

  factory :student do
    email 'afoo@fakemail.com'
    password 'pazzword123'
    password_confirmation 'pazzword123'
  end
end
