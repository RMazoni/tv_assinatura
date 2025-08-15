class RemovePlanAndPackageFromClients < ActiveRecord::Migration[8.0]
  def change
    remove_column :clients, :plan_id, :integer
    remove_column :clients, :package_id, :integer
  end
end
