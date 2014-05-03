class AddUrlToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :client_address, :string
  end
  def down
  	remove_column :users, :client_address
  end
end
