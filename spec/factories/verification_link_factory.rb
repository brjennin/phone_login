FactoryGirl.define do
  factory :verification_link do
    code { FFaker::String.from_regexp(/[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]/) }
    phone
  end
end
