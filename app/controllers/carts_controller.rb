class CartsController < ApplicationController
    def show
        @cart = Cart.all
        @product = Product.all
        @cart = Cart.find(params[:id])
        @cart_item = @cart.cart_items.build(product_id: params[:product_id]) if @cart_item.blank?
        @cart_item.save
        @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    end
end
