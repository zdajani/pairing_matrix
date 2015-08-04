FactoryGirl.define do

  factory :student do
    first_name 'Alice'
    last_name 'Foo'
    email 'afoo@fakemail.com'
    password 'pazzword123'
    password_confirmation 'pazzword123'
    current_pair '1'
  end
end
