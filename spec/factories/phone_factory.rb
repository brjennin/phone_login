FactoryGirl.define do
  factory :phone do
    number { FFaker::PhoneNumber.short_phone_number.gsub("-", "") }
  end
end
