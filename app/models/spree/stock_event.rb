class Spree::StockEvent < ApplicationRecord
  belongs_to :stock_item, class_name: 'Spree::StockItem', dependent: :destroy

  validates :event_name, presence: true
end
