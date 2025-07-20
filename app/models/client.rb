class Client < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  belongs_to :plan, optional: true
  belongs_to :package, optional: true
end
