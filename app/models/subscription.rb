class Subscription < ApplicationRecord
  validates :package_id, presence: false
  validates :plan_id, presence: false

  belongs_to :client
  belongs_to :package
  belongs_to :plan
end
