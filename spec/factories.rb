FactoryGirl.define do
  factory :user do
    password_digest "MyString"
    email "MyString"
    password_confirmation "MyString"
  end
end