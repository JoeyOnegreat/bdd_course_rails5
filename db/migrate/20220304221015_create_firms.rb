class CreateFirms < ActiveRecord::Migration[6.0]
  def change
    create_table :firms do |t|
      t.string :name
      t.string :trn
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
