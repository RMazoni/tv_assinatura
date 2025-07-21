class Package < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :additionals, length: { minimum: 1, message: "Must have at least one additional" }

  belongs_to :plan
  has_and_belongs_to_many :additionals
end
