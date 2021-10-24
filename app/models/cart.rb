class Cart < ApplicationRecord
    belongs_to :product
    has_many :cart_items
    has_many :cart_item_products, through: :cart_items, source: :product
end
