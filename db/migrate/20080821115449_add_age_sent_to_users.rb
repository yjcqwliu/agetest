class AddAgeSentToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :age, :integer
    add_column :users, :sent, :boolean
  end

  def self.down
    remove_column :users, :sent
    remove_column :users, :age
  end
end
