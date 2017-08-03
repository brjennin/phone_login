require "rails_helper"

RSpec.describe Api::VerificationLinksController, type: :request do
  describe "POST#create" do
    subject { post "/api/v1/verification_links", params: params.to_json, headers: headers }
    let(:params) { { phone_number: "16969696969" } }
    let(:headers) { { "Client-Token" => ENV["CLIENT_TOKEN"], "CONTENT_TYPE" => "application/json", "HTTP_ACCEPT" => "application/json" } }

    let(:phone) { double(Phone, id: 32, number: "6969696969") }
    let(:verification_link) { double(VerificationLink, id: 213, phone_id: phone.id, code: "abcd") }

    before do
      allow(PhoneRepository).to receive(:find_or_create_by_number).and_return(phone)
      allow(VerificationLinkRepository).to receive(:create_for_phone_id).and_return(verification_link)
      subject
    end

    it "find or creates a phone" do
      expect(PhoneRepository).to have_received(:find_or_create_by_number).with("16969696969")
    end

    it "creates a verification link" do
      expect(VerificationLinkRepository).to have_received(:create_for_phone_id).with(32)
    end

    it "returns 201 status code" do
      expect(response).to be_created
    end

    it "returns valid JSON" do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json[:id]).to eq(213)
      expect(json[:code]).to eq("abcd")
      expect(json[:phone_id]).to eq(32)
    end
  end
end
