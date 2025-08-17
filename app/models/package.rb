class Package < ApplicationRecord
  validates :name, presence: true
  validates :plan, presence: true
  validates :additionals, length: { minimum: 1, message: "Must have at least one additional" }

  belongs_to :plan
  has_many :subscriptions, dependent: :nullify
  has_and_belongs_to_many :additionals

  after_save :package_price_calculator # needs to be after_save bacause of HABTM association

  private

  def package_price_calculator
    if price.blank?
      calculated_price = plan.price + additionals.sum(:price)
      update_column(:price, calculated_price)
    end
  end
end
