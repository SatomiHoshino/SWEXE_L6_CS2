class Product < ApplicationRecord
    has_one :carts
    has_one :cart_items
end
