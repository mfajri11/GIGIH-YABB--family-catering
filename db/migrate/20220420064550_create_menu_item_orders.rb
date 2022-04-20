class CreateMenuItemOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_item_orders do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end
