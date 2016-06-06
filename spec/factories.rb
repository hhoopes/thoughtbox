FactoryGirl.define do
  factory :link do
    url "http://example.com"
    title "New link"
    read false
  end
  factory :user do
    email "name@example.com"
    password "password"
  end
end
