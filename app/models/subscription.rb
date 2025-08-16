class Subscription < ApplicationRecord
  validates :package_id, presence: false
  validates :plan_id, presence: false
  validate :can_have_plan_or_package_not_both

  belongs_to :client
  belongs_to :package
  belongs_to :plan
  has_and_belongs_to_many :additionals
  has_many :bills, dependent: :destroy

  private

  def can_have_plan_or_package_not_both
    if plan.present? && package.present?
      errors.add(:base, "Only plan or package allowed.")
    end
  end

end