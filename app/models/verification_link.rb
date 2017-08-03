class VerificationLink < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :phone, presence: true

  belongs_to :phone
end
