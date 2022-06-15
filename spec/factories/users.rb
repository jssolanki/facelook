FactoryBot.define do
  factory :user do
    emails {Faker::Internet:emails }
    first_name {Faker::Internet:first_name }
  end
end
