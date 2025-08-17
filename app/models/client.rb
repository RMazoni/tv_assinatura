class Client < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validate :must_be_at_least_18_years_old

  has_one :subscription, dependent: :destroy


  private

  def must_be_at_least_18_years_old
    return unless birth_date.present?

    if birth_date > 18.years.ago.to_date
      errors.add(:birth_date, "Client must be at least 18 years old.")
    end
  end
end
