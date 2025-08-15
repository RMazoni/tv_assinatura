class Bill < ApplicationRecord
  belongs_to :subscription
  belongs_to :additional, optional: true

  validates :bill_type, presence: true, inclusion: { in: %w[plan package additional] }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validates :additional, presence: true, if: -> { bill_type == "additional" }
  validates :additional, absence: true, unless: -> { bill_type == "additional" }
end
