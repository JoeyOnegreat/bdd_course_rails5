class AddStatusToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :status, :string
  end
end
