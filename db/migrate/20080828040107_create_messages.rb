class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.integer :user_xid
      t.integer :target_xid
      t.string :message
      t.boolean :notified

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
