class AllowNullIdsInSubscriptions < ActiveRecord::Migration[8.0]
  def change
    change_column_null :subscriptions, :package_id, true
    change_column_null :subscriptions, :plan_id, true
  end
end
