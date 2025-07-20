class Package < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  belongs_to :plan
end
