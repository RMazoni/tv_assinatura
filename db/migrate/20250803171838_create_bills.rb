class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.references :subscription, null: false, foreign_key: true
      t.string :bill_type
      t.references :additional, null: true, foreign_key: true
      t.date :due_date
      t.decimal :amount

      t.timestamps
    end
  end
end
