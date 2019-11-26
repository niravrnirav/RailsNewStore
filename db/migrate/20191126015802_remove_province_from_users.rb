class RemoveProvinceFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :province, :string
  end
end
