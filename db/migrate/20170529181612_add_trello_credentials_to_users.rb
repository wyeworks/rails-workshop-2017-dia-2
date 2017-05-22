class AddTrelloCredentialsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :developer_public_key, :string
    add_column :users, :member_token, :string
  end
end
