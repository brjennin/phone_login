require 'rails_helper'

RSpec.describe VerificationLink, type: :model do
  describe "validations" do
    it "requires a unique code" do
      phone = create(:phone)
      VerificationLink.create!(code: "abcd", phone: phone)
      expect(VerificationLink.new(code: nil, phone: nil)).to_not be_valid
      expect(VerificationLink.new(code: "aaaa", phone: nil)).to_not be_valid
      expect(VerificationLink.new(code: nil, phone: phone)).to_not be_valid
      expect(VerificationLink.new(code: "abcd", phone: phone)).to_not be_valid
      expect(VerificationLink.new(code: "aaaa", phone: phone)).to be_valid
    end
  end
end
