FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read "MyString"
  end
  factory :user do
    email "name@example.com"
    password "password"
  end
end
