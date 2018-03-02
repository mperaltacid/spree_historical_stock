Spree::StockItem.class_eval do
  has_many :spree_stock_events, class_name: 'Spree::StockEvent'

  after_save :generate_out_of_stock_event

  def generate_out_of_stock_event
    unless in_stock? || self.count_on_hand < 0
      self.spree_stock_events.create(
        stock_item_id: self.id,
        event_name:"out_of_stock",
        record_count_on_hand: self.count_on_hand,
        record_backorderable: self.backorderable)
    end
  end

end
