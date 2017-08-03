class Phone < ApplicationRecord
  validates :number, uniqueness: true, presence: true
end
