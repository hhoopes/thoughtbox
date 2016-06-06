FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read "MyString"
  end
  factory :user do
    password_digest "MyString"
    email "MyString"
    password_confirmation "MyString"
  end
end