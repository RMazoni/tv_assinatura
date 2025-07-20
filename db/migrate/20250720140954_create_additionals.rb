class CreateAdditionals < ActiveRecord::Migration[8.0]
  def change
    create_table :additionals do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
