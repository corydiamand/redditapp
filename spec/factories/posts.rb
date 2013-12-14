# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    contents "MyText"
    url "MyString"
  end
end
