class PhoneRepository
  def self.find_or_create_by_number(number)
    Phone.find_or_create_by(number: number)
  end
end
