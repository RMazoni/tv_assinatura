class CreateJoinTableSubscriptionsAdditionals < ActiveRecord::Migration[8.0]
  def change
    create_join_table :subscriptions, :additionals do |t|
      # t.index [:subscription_id, :additional_id]
      # t.index [:additional_id, :subscription_id]
    end
  end
end
