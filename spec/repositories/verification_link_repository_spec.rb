require "rails_helper"

RSpec.describe VerificationLinkRepository do
  describe ".create_for_phone_id" do
    let(:phone) { create(:phone) }
    subject { described_class.create_for_phone_id(phone.id) }

    it "creates a new verification link" do
      expect { subject }.to change { VerificationLink.count }.by(1)
    end

    it "returns the verification link" do
      record = subject
      expect(record).to be_a_kind_of(VerificationLink)
      expect(record.phone).to eq(phone)
      expect(record.code).to be_a_kind_of(String)
    end

    it "puts an item in the database" do
      expect(subject).to be_persisted
      expect(subject).to eq(VerificationLink.last)
    end

    it "generates a new code every time" do
      first = described_class.create_for_phone_id(phone.id)
      second = described_class.create_for_phone_id(phone.id)
      expect(first.code).to_not eq(second.code)
    end

    it "generates a reasonably long code" do
      expect(subject.code.length).to eq(8)
    end
  end
end
