class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :is_read
      t.string :content

      t.timestamps
    end
  end
end
