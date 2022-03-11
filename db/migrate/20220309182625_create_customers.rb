class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customerFirstName
      t.string :customerLastName
      t.integer :customerPhone
      t.string :customerEmail
      t.string :businessName
      t.string :businessLogo
      t.integer :businessTrn
      t.string :businessEmail
      t.string :businessAddress
      t.integer :businessPhone

      t.timestamps
    end
  end
end
