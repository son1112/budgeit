class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :amount
      t.text :description
      t.string :category
      t.integer :account_id

      t.timestamps
    end
  end
end
