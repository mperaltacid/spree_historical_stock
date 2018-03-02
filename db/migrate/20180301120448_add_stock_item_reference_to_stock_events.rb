class AddStockItemReferenceToStockEvents < SpreeExtension::Migration[4.2]
  def change
    add_reference(:spree_stock_events, :stock_item, index: true, foreign_key: { to_table: :spree_stock_item })
  end
end
