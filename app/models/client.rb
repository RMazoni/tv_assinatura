class Client < ApplicationRecord
  belongs_to :plan
  belongs_to :package
end
