class AddIndexToUsers < ActiveRecord::Migration
  def self.up
  add_index :users, [:xid, :age]
  end

  def self.down
  remove_index :users, [:xid, :age]
  end
end
