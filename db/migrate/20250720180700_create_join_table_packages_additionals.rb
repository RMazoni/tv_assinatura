class CreateJoinTablePackagesAdditionals < ActiveRecord::Migration[8.0]
  def change
    create_join_table :packages, :additionals do |t|
      # t.index [:package_id, :additional_id]
      # t.index [:additional_id, :package_id]
    end
  end
end
