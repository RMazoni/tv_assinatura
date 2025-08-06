class Additional < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :subscriptions
end
