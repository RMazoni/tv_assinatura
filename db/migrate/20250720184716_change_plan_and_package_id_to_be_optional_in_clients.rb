class ChangePlanAndPackageIdToBeOptionalInClients < ActiveRecord::Migration[8.0]
  def change
    change_column_null :clients, :plan_id, true
    change_column_null :clients, :package_id, true
  end
end
