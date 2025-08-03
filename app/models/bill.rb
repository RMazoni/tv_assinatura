class Bill < ApplicationRecord
  belongs_to :subscription
  belongs_to :additional, optional: true
end
