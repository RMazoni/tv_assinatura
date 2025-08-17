class Plan < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :subscriptions, dependent: :nullify
end
