require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe "validations" do
    it "requires a unique number" do
      Phone.create!(number: "1234567890")
      expect(Phone.new(number: nil)).to_not be_valid
      expect(Phone.new(number: "1234567890")).to_not be_valid
      expect(Phone.new(number: "1234567891")).to be_valid
    end
  end
end
