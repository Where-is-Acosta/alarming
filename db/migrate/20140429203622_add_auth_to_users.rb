class AddAuthToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :mixcloud_auth_token, :string
  end
  def down
  	remove_column :users, :mixcloud_auth_token
  end
end
