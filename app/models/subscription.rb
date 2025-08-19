class Subscription < ApplicationRecord
  validate :can_have_plan_or_package_not_both
  validate :can_have_package_or_additionals_not_both
  validate :must_have_plan_or_package

  belongs_to :client
  belongs_to :package, optional: true
  belongs_to :plan, optional: true
  has_and_belongs_to_many :additionals
  has_many :bills, dependent: :destroy

  private

  def can_have_plan_or_package_not_both
    if plan.present? && package.present?
      errors.add(:base, "Client can not have plan and package together.")
    end
  end

  def can_have_package_or_additionals_not_both
    if package.present? && additionals.present?
      errors.add(:base, "Client can not have package and additionals together.")
    end
  end

  def must_have_plan_or_package
    unless plan.present? || package.present?
      errors.add(:base, "Must have either a plan or a package.")
    end
  end
end
