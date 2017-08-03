require "rails_helper"

RSpec.describe PhoneRepository do
  describe ".find_or_create_by_number" do
    subject { described_class.find_or_create_by_number("1234567890") }

    context "when the number exists in the db already" do
      let!(:existing) { Phone.create!(number: "1234567890") }

      it "does not create a new phone" do
        expect { subject }.to_not change { Phone.count }
      end

      it "returns the existing phone" do
        expect(subject).to eq(existing)
      end
    end

    context "when the number does NOT exist in the db already" do
      it "creates a new phone" do
        expect { subject }.to change { Phone.count }.by(1)
      end

      it "puts an item in the database" do
        expect(subject).to be_persisted
        expect(subject).to eq(Phone.last)
      end

      it "returns the phone" do
        record = subject
        expect(record).to be_a_kind_of(Phone)
        expect(record.number).to eq("1234567890")
      end
    end
  end
end
