class AddFromIdToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :from_id, :integer
  end

  def self.down
    remove_column :messages, :from_id
  end
end
