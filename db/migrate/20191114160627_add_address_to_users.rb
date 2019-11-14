class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
  end
end
