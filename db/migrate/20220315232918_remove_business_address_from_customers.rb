class RemoveBusinessAddressFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :businessAddress, :string
  end
end
