class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string :user_number
      t.string :service_number

      t.timestamps
    end
  end
end
