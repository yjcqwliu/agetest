class CreateFriendtests < ActiveRecord::Migration
  def self.up
    create_table :friendtests do |t|
      t.integer :user_id
      t.integer :target_xid
	  t.string :target_name
      t.string :resualt
      t.boolean :notified
	  t.boolean :sent

      t.timestamps
    end
  end

  def self.down
    drop_table :friendtests
  end
end
