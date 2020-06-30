class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.string :name
      t.integer :current_balance
      t.integer :user_id

      t.timestamps
    end
  end
end
