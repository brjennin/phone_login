module Api
  class VerificationLinksController < ApplicationController
    def create
      phone = PhoneRepository.find_or_create_by_number(params[:phone_number])
      verification_link = VerificationLinkRepository.create_for_phone_id(phone.id)
      render json: {
        id: verification_link.id,
        code: verification_link.code,
        phone_id: verification_link.phone_id,
      }, status: :created
    end
  end
end
