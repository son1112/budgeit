class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :from
      t.text :body
      t.integer :conversation_id

      t.timestamps
    end
  end
end
