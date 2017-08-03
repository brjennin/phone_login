class VerificationLinkRepository
  def self.create_for_phone_id(phone_id)
    code = generate_random_string
    VerificationLink.create!(code: code, phone_id: phone_id)
  end

  def self.generate_random_string(size = 8)
    charset = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
  private_class_method :generate_random_string
end
