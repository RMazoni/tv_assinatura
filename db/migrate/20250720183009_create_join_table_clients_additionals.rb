class CreateJoinTableClientsAdditionals < ActiveRecord::Migration[8.0]
  def change
    create_join_table :clients, :additionals do |t|
      # t.index [:client_id, :additional_id]
      # t.index [:additional_id, :client_id]
    end
  end
end
