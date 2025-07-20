class Client < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  belongs_to :plan
  belongs_to :package
end
