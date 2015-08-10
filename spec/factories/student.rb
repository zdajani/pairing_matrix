FactoryGirl.define do
  
  sequence :email do |n|
    "afoo#{n}@fakemail.com"
  end
  
  sequence :first_name do |n|
    "CatNumber#{n}"
  end

  factory :student do
    first_name
    last_name 'Foo'
    email
    password 'pazzword123'
    password_confirmation 'pazzword123'
    current_pair '1'
  end
end
