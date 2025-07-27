class RemoveSubscriptionIdFromClients < ActiveRecord::Migration[8.0]
  def change
    remove_reference :clients, :subscription
  end
end
