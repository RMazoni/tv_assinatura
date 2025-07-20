class Package < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  belongs_to :plan
  has_and_belongs_to_many :additionals
end
