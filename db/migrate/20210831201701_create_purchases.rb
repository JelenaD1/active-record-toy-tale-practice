class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.integer :toy_id
      t.integer :kid_id
    end 
  end
end
