class CreateSpreeStockEvents < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_stock_events do |t|
      t.string :event_name, null: false
      t.integer :record_count_on_hand
      t.boolean :record_backorderable

      t.timestamps
    end
  end
end
